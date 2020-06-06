<?php
#app/Http/Admin/Controllers/ProcessController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ShopProduct;
use App\Models\ShopProductDescription;
use App\Models\ShopSpecialPrice;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use Excel;
use Illuminate\Http\Request;

class ProcessController extends Controller
{
    use HasResourceActions;
    /**
     * Index interface.
     *
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('Index')
            ->description(' ')
            ->body('');
    }

    public function importProduct(Content $content, Request $request)
    {
        if ($request->getMethod() == 'POST') {
            $validatedData = \Validator::make($request->all(), [
                'import_file' => 'required|mimes:xlsx',
            ]);
            if ($validatedData->fails()) {
                return redirect()->back()->withErrors($validatedData->errors());
            } else {
                Excel::load($request->file('import_file'), function ($reader) use ($request) {
                    $reader->skipRows(1); //
                    $arrError   = array();
                    $arrSuccess = array();
                    foreach ($reader->toArray() as $key => $row) {
                        if (ShopProduct::where('sku', $row['sku'])->first()) {
                            $arrError[] = $row['sku'] . ': already exist!';
                        } else {
                            try {
                                $arrMapping                = array();
                                $arrMapping['sku']         = $row['sku'];
                                $arrMapping['price']       = (int) $row['price'];
                                $arrMapping['cost']        = (int) $row['cost'];
                                $arrMapping['stock']       = (int) $row['stock'];
                                $arrMapping['category_id'] = (int) $row['category_id'];
                                $arrMapping['brand_id']    = (int) $row['brand_id'];
                                $arrMapping['vendor_id']   = (int) $row['vendor_id'];
                                $arrMapping['company_id']  = $this->getUserCompany()[0]->id;
                                $id                        = ShopProduct::insertGetId($arrMapping);
                                $descriptons               = [
                                    'product_id'  => $id,
                                    'name'        => $row['name'],
                                    'description' => $row['description'],
                                    'keyword'     => $row['keyword'],
                                    'content'     => $row['content'],
                                    'lang_id'     => (int) $row['language'],
                                ];
                                ShopProductDescription::insert($descriptons);
                                if ($row['special_price']) {
                                    ShopSpecialPrice::insert([
                                        'product_id' => $id,
                                        'price'      => $row['special_price'],
                                        'status'     => 1,
                                    ]);
                                }
                                $arrSuccess[] = $row['sku'];
                            } catch (\Exception $e) {
                                // $arrError[] = $row['sku'] . ': have error ' . $e->getMessage();
                                $arrError[] = $row['sku'] . ': have error';
                            }
                        }

                    }
                    if ($arrSuccess) {
                        $request->session()->flash('import_success', $arrSuccess);
                    }
                    if ($arrError) {
                        $request->session()->flash('import_error', $arrError);
                    }
                    return back();
                });
            }
        }

        return $content
            ->header(trans('language.process.productImport'))
            ->description(' ')
            ->body($this->getImportProduct());
    }

    public function getImportProduct()
    {
        return view('admin.ImportProduct')->render();

    }

}

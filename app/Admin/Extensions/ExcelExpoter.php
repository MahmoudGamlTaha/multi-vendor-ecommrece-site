<?php

namespace App\Admin\Extensions;

use App\User;
use Encore\Admin\Grid\Exporters\AbstractExporter;
use Maatwebsite\Excel\Facades\Excel;

class ExcelExpoter extends AbstractExporter
{
    public $filename;
    public $sheetname;
    public $limit;
    public $type;
    public $function;
    public function __construct($function = null, $filename = 'Export File', $type = "xls", $sheetname = 'Sheet')
    {
        $this->filename  = $filename;
        $this->sheetname = $sheetname;
        $this->type      = $type;
        $this->function  = $function;

    }

    public function export()
    {
        // dd($this->getData());
        if ($this->function == null) {
            $dataExport = $this->getData();
            $header     = true;
        } else {
            $dataExport = $this->{$this->function}();
            $header     = false;
        }
        Excel::create($this->filename, function ($excel) use ($dataExport, $header) {
            $excel->sheet($this->sheetname, function ($sheet) use ($dataExport, $header) {
                $sheet->fromArray($dataExport, $nullValue = null, $startCell = 'A1', $strictNullComparison = false, $headingGeneration = $header);

                // $sheet->cell('A1', function ($cell) {$cell->setValue('Dữ Liệu');});
                // $sheet->cell('B1', function ($cell) {$cell->setValue('Mã hóa');});
                // $sheet->cell('C1', function ($cell) {$cell->setValue('Email');});
                // if (!empty($data)) {
                //     foreach ($data as $key => $value) {
                //         $i = $key + 2;
                //         $sheet->cell('A' . $i, $value['firstname']);
                //         $sheet->cell('B' . $i, $value['lastname']);
                //         $sheet->cell('C' . $i, $value['email']);
                //     }
                // }

            });

        })->export($this->type);
    }

    public function dataOrder()
    {
        $data     = $this->getData();
        $dataRows = [];
        foreach ($data as $key => $value) {
            $dataRows[] = [
                '#' . $value['id'],
                (int) $value['subtotal'],
                (int) $value['shipping'],
                (int) $value['discount'],
                (int) $value['total'],
                ($value['user_id']) ? 'Đã đăng ký' : 'Chưa đăng ký',
                !empty($value['customer']['email']) ? $value['customer']['email'] : 'N/A',
                $value['toname'],
                $value['address1'] . ' ' . $value['address2'],
                $value['phone'],
                $value['comment'],
                $value['created_at'],

            ];
        }

        $arrTitle = ['Số Order', 'Tổng tiền hàng', 'Tiền ship', 'Tiền giảm giá', 'Tổng tiền', 'ID khách hàng', 'Email', 'Tên người nhận', 'Địa chỉ', 'Số điện thoại', 'Ghi chú', 'Ngày tạo'];
        return array_merge([$arrTitle], $dataRows);
    }

    public function dataCustomer()
    {
        $data     = $this->getData();
        $dataRows = [];
        foreach ($data as $key => $value) {
            $dataRows[] = [
                $value['id'],
                $value['name'],
                $value['email'],
                $value['address1'] . ' ' . $value['address2'],
                $value['phone'],
                $value['created_at'],
            ];
        }

        $arrTitle = ['ID', 'Tên', 'Email', 'Địa chỉ', 'Số điện thoại', 'Ngày tạo'];
        return array_merge([$arrTitle], $dataRows);
    }

    public function dataCustomer_report()
    {
        $data     = $this->getData();
        $dataRows = [];
        foreach ($data as $key => $value) {
            $orders       = User::find($value['id'])->orders;
            $total_order  = $orders->count();
            $total_amount = 0;
            foreach ($orders as $key => $order) {
                $total_amount += $order->total;
            }
            $dataRows[] = [
                $value['id'],
                $value['name'],
                $value['email'],
                $value['address1'] . ' ' . $value['address2'],
                $value['phone'],
                $total_order,
                number_format($total_amount),

                $value['created_at'],
            ];
        }
        $arrTitle = ['ID', 'Tên', 'Email', 'Địa chỉ', 'Số điện thoại', 'Tổng đơn hàng', 'Tiển tiền hàng', 'Ngày tạo'];
        return array_merge([$arrTitle], $dataRows);
    }
}

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
    <style>
        @media only screen and (max-width: 600px) {
            .inner-body {
                width: 100% !important;
            }

            .footer {
                width: 100% !important;
            }
        }

        @media only screen and (max-width: 500px) {
            .button {
                width: 100% !important;
            }
        }
    </style>

    <table class="wrapper" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">
                <table class="content" width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="header">
                            {{ trans('language.email.order.title_1',['website'=>config('app.name')]) }}
{{--                             <a href="{{ $url }}">
                                {{ $slot }}
                            </a> --}}
                        </td>
                    </tr>

                    <!-- Email Body -->
                    <tr>
                        <td class="body" width="100%" cellpadding="0" cellspacing="0">
                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0">
                                <!-- Body content -->
                                <tr>
                                    <td>
                                        <b>{{ trans('language.email.order.order_id') }}</b>: {{ $id }}<br>
                                        <b>{{ trans('language.email.order.toname') }}</b>: {{ $toname }}<br>
                                        <b>{{ trans('language.email.order.address') }}</b>: {{ $address1.' '.$address2 }}<br>
                                        <b>{{ trans('language.email.order.phone') }}</b>: {{ $phone }}<br>
                                        <b>{{ trans('language.email.order.note') }}</b>: {{ $comment }}
                                    </td>
                                </tr>
                            </table>
                            <hr>
                            <p style="text-align: center;">{{ trans('language.email.order.order_detail') }}:<br>
                            ===================================<br></p>
                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0" border="1">
                                <tr>
                                    <td>{{ trans('language.email.order.sort') }}</td>
                                    <td>{{ trans('language.email.order.sku') }}</td>
                                    <td>{{ trans('language.email.order.name') }}</td>
                                    <td>{{ trans('language.email.order.note') }}</td>
                                    <td>{{ trans('language.email.order.qty') }}</td>
                                    <td>{{ trans('language.email.order.total') }}</td>
                                </tr>
                                @foreach ($details as $key => $detail)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $detail['sku'] }}</td>
                                    <td>{{ $detail['name'] }}</td>
                                    <td>{{ \Helper::currencyRender($detail['price']) }}</td>
                                    <td>{{ number_format($detail['qty']) }}</td>
                                    <td align="right">{{ \Helper::currencyRender($detail['total_price']) }}</td>
                                </tr>
                                @endforeach
                                <tr>
                                    <td colspan="2"></td>
                                    <td colspan="2" style="font-weight: bold;">{{ trans('language.email.order.sub_total') }}</td>
                                    <td colspan="2" align="right">{{ \Helper::currencyRender($subtotal) }}</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                    <td colspan="2" style="font-weight: bold;">{{ trans('language.email.order.shipping_fee') }}</td>
                                    <td colspan="2" align="right">{{ \Helper::currencyRender($shipping) }}</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                    <td colspan="2" style="font-weight: bold;">{{ trans('language.email.order.discount') }}</td>
                                    <td colspan="2" align="right">{{ \Helper::currencyRender($discount) }}</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                    <td colspan="2" style="font-weight: bold;">{{ trans('language.email.order.order_total') }}</td>
                                    <td colspan="2" align="right">{{ \Helper::currencyRender($total) }}</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="footer" align="center" width="570" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="content-cell" align="center">
                                        <p>&nbsp;</p>
                                         &copy; {{ date('Y') }} <a href="{{ url('/') }}">{{ config('app.name') }}</a>. All rights reserved.
                                        {{-- {{ Illuminate\Mail\Markdown::parse($slot) }} --}}
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>
</body>
</html>

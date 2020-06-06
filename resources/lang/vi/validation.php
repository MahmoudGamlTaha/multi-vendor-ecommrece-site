<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | The following language lines contain the default error messages used by
    | the validator class. Some of these rules have multiple versions such
    | as the size rules. Feel free to tweak each of these messages here.
    |
     */

    'accepted'             => 'Thuộc tính :attribute phải được chấp nhận.',
    'active_url'           => 'Thuộc tính :attribute không phải là URL hợp lệ.',
    'after'                => 'Thuộc tính :attribute phải sau ngày :date.',
    'after_or_equal'       => 'Thuộc tính :attribute phải sau hoặc bằng ngày :date.',
    'alpha'                => 'Thuộc tính :attribute chỉ có thể chứa chữ cái.',
    'alpha_dash'           => 'Thuộc tính :attribute chỉ có thể chứa chữ cái, số, và dấu gạch ngang.',
    'alpha_num'            => 'Thuộc tính :attribute chỉ có thể chứa chữ cái và số.',
    'array'                => 'Thuộc tính :attribute phải là một mảng.',
    'before'               => 'Thuộc tính :attribute phải là một ngày trước :date.',
    'before_or_equal'      => 'Thuộc tính :attribute phải là ngày trước hoặc bằng :date.',
    'between'              => [
        'numeric' => 'Giá trị :attribute và nằm giữa :min và :max.',
        'file'    => 'The :attribute must be between :min and :max kilobytes.',
        'string'  => 'The :attribute must be between :min and :max characters.',
        'array'   => 'The :attribute must have between :min and :max items.',
    ],
    'boolean'              => 'The :attribute field must be true or false.',
    'confirmed'            => 'The :attribute confirmation does not match.',
    'date'                 => 'The :attribute is not a valid date.',
    'date_format'          => 'The :attribute does not match the format :format.',
    'different'            => 'The :attribute and :other must be different.',
    'digits'               => 'The :attribute must be :digits digits.',
    'digits_between'       => 'The :attribute must be between :min and :max digits.',
    'dimensions'           => 'The :attribute has invalid image dimensions.',
    'distinct'             => 'Thuộc tính :attribute có giá trị trùng lặp.',
    'email'                => 'Định dạng email chưa đúng.',
    'phone'                => 'Định dạng số điện thoại chưa đúng',
    'exists'               => 'Giá trị được chọn :attribute không hợp lệ.',
    'file'                 => ':attribute phải là 1 file.',
    'filled'               => ':attribute phải có một giá trị.',
    'gt'                   => [
        'numeric' => 'Thuộc tính :attribute phải lớn hơn :value.',
        'file'    => 'Thuộc tính :attribute phải lớn hơn :value kilobytes.',
        'string'  => 'Thuộc tính :attribute phải lớn hơn :value characters.',
        'array'   => 'Thuộc tính :attribute phải có nhiều hơn :value phần tử.',
    ],
    'gte'                  => [
        'numeric' => 'Thuộc tính :attribute phải lớn hơn hoặc bằng :value.',
        'file'    => 'Thuộc tính :attribute phải lớn hơn hoặc bằng :value kilobytes.',
        'string'  => 'Thuộc tính :attribute phải lớn hơn hoặc bằng :value characters.',
        'array'   => 'Thuộc tính :attribute phải có :value phần tử hoặc hơn.',
    ],
    'image'                => 'Thuộc tính :attribute phải là một hình ảnh.',
    'in'                   => 'Thuộc tính đã chọn không hợp lệ.',
    'in_array'             => 'Thuộc tính :attribute không tồn tại trong :other.',
    'integer'              => 'Thuộc tính :attribute phải là số.',
    'ip'                   => 'Thuộc tính :attribute phải là địa chỉ IP.',
    'ipv4'                 => 'Thuộc tính :attribute phải là IPv4.',
    'ipv6'                 => 'Thuộc tính :attribute phải là một IPv6.',
    'json'                 => 'Thuộc tính :attribute phải là một JSON.',
    'lt'                   => [
        'numeric' => 'The :attribute phải nhỏ hơn :value.',
        'file'    => 'The :attribute phải nhỏ hơn :value kilobytes.',
        'string'  => 'The :attribute phải nhỏ hơn :value kí tử.',
        'array'   => 'The :attribute phải có ít hơn :value phần tử.',
    ],
    'lte'                  => [
        'numeric' => 'Thuộc tính :attribute phải nhỏ hơn hoặc bằng :value.',
        'file'    => 'Thuộc tính :attribute phải nhỏ hơn hoặc bằng :value kilobytes.',
        'string'  => 'Thuộc tính :attribute phải nhỏ hơn hoặc bằng :value characters.',
        'array'   => 'Thuộc tính :attribute must not have more than :value items.',
    ],
    'max'                  => [
        'numeric' => 'Thuộc tính :attribute không được lớn hơn :max.',
        'file'    => 'File :attribute không thể lớn hơn :max kilobytes.',
        'string'  => 'Thuộc tính :attribute không thẻ lớn hơn :max kí tự.',
        'array'   => 'Mảng :attribute không thể nhiều hơn :max phần tử.',
    ],
    'mimes'                => 'Thuộc tính :attribute must be a file of type: :values.',
    'mimetypes'            => 'The :attribute must be a file of type: :values.',
    'min'                  => [
        'numeric' => 'Thuộc tính :attribute tối thiểu nhỏ nhất là :min.',
        'file'    => 'Thuộc tính :attribute tối thiểu nhỏ nhất là :min kilobytes.',
        'string'  => 'Thuộc tính :attribute tối thiểu nhỏ nhất là :min characters.',
        'array'   => 'Thuộc tính :attribute tối thiểu nhỏ nhất là :min phần tử.',
    ],
    'not_in'               => 'Thuộc tính được lựa chọn :attribute là không hợp lệ.',
    'not_regex'            => 'Thuộc tính :attribute có định dạng không hợp lệ.',
    'numeric'              => 'Thuộc tính :attribute phải là số.',
    'present'              => 'The :attribute field must be present.',
    'regex'                => 'The :attribute format is invalid.',
    'required'             => 'Giá trị :attribute là bắt buộc.',
    'required_if'          => 'The :attribute field is required when :other is :value.',
    'required_unless'      => 'The :attribute field is required unless :other is in :values.',
    'required_with'        => 'The :attribute field is required when :values is present.',
    'required_with_all'    => 'The :attribute field is required when :values is present.',
    'required_without'     => 'The :attribute field is required when :values is not present.',
    'required_without_all' => 'The :attribute field is required when none of :values are present.',
    'same'                 => 'The :attribute and :other must match.',
    'size'                 => [
        'numeric' => 'The :attribute must be :size.',
        'file'    => 'The :attribute must be :size kilobytes.',
        'string'  => 'The :attribute must be :size characters.',
        'array'   => 'The :attribute must contain :size items.',
    ],
    'string'               => 'Giá trị :attribute phải là một chuỗi.',
    'timezone'             => 'The :attribute must be a valid zone.',
    'unique'               => 'Giá trị :attribute đã được sử dụng.',
    'uploaded'             => 'Upload :attribute thất bại.',
    'url'                  => 'Định dạng :attribute không hợp lệ.',
    'validate_nickname'    => 'Giá trị này phải là duy nhất. Viết liền, không dấu, không được trùng nhau.',

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | Here you may specify custom validation messages for attributes using the
    | convention "attribute.rule" to name the lines. This makes it quick to
    | specify a specific custom language line for a given attribute rule.
    |
     */

    'custom'               => [
        'attribute-name' => [
            'rule-name' => 'custom-message',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Attributes
    |--------------------------------------------------------------------------
    |
    | The following language lines are used to swap attribute place-holders
    | with something more reader friendly such as E-Mail Address instead
    | of "email". This simply helps us make messages a little cleaner.
    |
     */

    'attributes'           => [],

];

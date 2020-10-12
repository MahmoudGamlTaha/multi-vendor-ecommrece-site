<p align="center">
    <img src="http://highcoder.com/img/logo.png" width="150"><br>
</p>
## About multi vendor 
Free Open source E-commerce use Laravel framework for Business using s-cart platform 

## Technology
- Core <a href="https://laravel.com">Laravel Framework</a>
- Back-end <a href="http://laravel-admin.org">Laravel Admin</a>
## List Functions of  multi vendor

======= SHOPPING =======

- Multi-language
- Currencies
- Customer sign up
- Purchase history
- Process cart
- Manage product: price sale, cost price, promotion price, quantity, multi images, attributes ..
- Categories product
- Brand product
- Api manager

======= SYSTEM MANAGEMENT =======

- Manage & permission users, groups
- Customer management
- Image management
- Order management: edit orders, update payment status, shipping status ...
- Order history
- Report:  chart, statistics, export csv, pdf...
- Generate image thumbnail, watermark
- Manage banner, logo
- Configure email SMTP
- System configuration: turn off website, hide / show products

======= EXTENSIONS =======

- Shipping
- Discount
- Payment
...Support for integrated extension from 3rd party

======= MODULES =======

- Blog/News
- Cms content: content categories, entries
...Support for integrated modules from 3rd party


## Requirements:

Version 2.2.x:

> Core laravel framework 5.7. Requirements::

```
- PHP >= 7.1.3
- OpenSSL PHP Extension
- PDO PHP Extension
- Mbstring PHP Extension
- Tokenizer PHP Extension
- XML PHP Extension
- Ctype PHP Extension
- JSON PHP Extension
- BCMath PHP Extension
```


Version 1.6 ~ 2.1.x:

> Core laravel framework 5.6. Requirements::

```
- PHP >= 7.1.3
- OpenSSL PHP Extension
- PDO PHP Extension
- Mbstring PHP Extension
- Tokenizer PHP Extension
- XML PHP Extension
- Ctype PHP Extension
- JSON PHP Extension
```


## Installation & configuration:
OR manual installation:
```
- Import file sql ./s-cart-multishop.sql to database.
- Rename file .env.example to .env if file .env not exist.
- Genarate API key if APP_KEY is null. Use command "php artisan key:generate"
- Config value of file .env:
    APP_URL=http://localhost
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=s-cart-multishop
    DB_USERNAME=root
    DB_PASSWORD=
```
extract vendor.zip file in his same location
- Access to url admin: your-domain/system_admin.
- User/pass <code><b>admin</b>/<b>admin</b></code>

## Demo:
- fornt-end : uploded here but not avaliable demo till now
- Back-end: http://dokkan.dokkancairo.com/  <code>User/company/pass: superadmin/master/admin</code>


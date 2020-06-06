<p align="center">
    <img src="https://s-cart.org/logo.png" width="150"><br>
</p>
<p align="center">Open source e-commerce for business use laravel framework</p>
<p align="center">
<a href="https://demo.s-cart.org">Demo</a> | <a href="https://demo.s-cart.org/system_admin">Demo admin</a> | <a href="https://s-cart.org">Home page</a> | <a href="https://s-cart.org/installation.html">Installation</a> | <a href="https://s-cart.org/video-guide.html">Video Guide</a>
</p>
<p align="center">
<a href="https://packagist.org/packages/lanhktc/s-cart"><img src="https://poser.pugx.org/lanhktc/s-cart/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/lanhktc/s-cart"><img src="https://poser.pugx.org/lanhktc/s-cart/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/lanhktc/s-cart"><img src="https://poser.pugx.org/lanhktc/s-cart/license.svg" alt="License"></a>
</p>
<p align="center"><img src="https://s-cart.org/images/screen/v22/s-cart-1.jpg"></p>
<p align="center"><img src="https://s-cart.org/images/screen/v22/product-detail.jpg"></p>
<p align="center"><img src="https://s-cart.org/images/screen/v22/s-cart-2.jpg"></p>
<p align="center"><img src="https://s-cart.org/images/screen/v22/s-cart-3.jpg"></p>
<p align="center"><img src="https://s-cart.org/images/screen/v22/s-cart-4.jpg"></p>
<p align="center"><img src="https://s-cart.org/images/screen/v22/s-cart-5.jpg"></p>
<p align="center"><img src="https://s-cart.org/images/screen/v22/s-cart-6.jpg"></p>
<p align="center"><img src="https://s-cart.org/images/screen/v22/s-cart-8.jpg"></p>
<p align="center"><img src="https://s-cart.org/images/screen/v22/s-cart-9.jpg"></p>
<p align="center"><img src="https://s-cart.org/images/screen/v22/s-cart-10.jpg"></p>



## About S-cart
Free Open source E-commerce use Laravel framework for Business

## Technology
- Core <a href="https://laravel.com">Laravel Framework</a>
- Back-end <a href="http://laravel-admin.org">Laravel Admin</a>
- In addition, s-cart also integrates other free open source libraries.

## List Functions of S-cart

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

<b>How to map your domain to s-cart? <a href="https://s-cart.org/installation.html">CLICK HERE</a></b>

Step1: Install last version S-cart
```
composer create-project lanhktc/s-cart
```
Step2:
- Chmod -R 777 public/documents/website
- Chmod -R 777 storage
- Chmod -R 777 vendor
- Folder thumbnail is  <b>public/documents/website/thumb</b>.

Step3:
```
- Create a new database. Example database name is s-cart
```

Step4:

=> From version 2.1.1, you can install s-cart by link: <code><b>your-domain.com/install.php</b></code>

```
Then, access your-domain.com/install.php to install S-cart.
If installing with link "install.php" unsuccessful, you can install it manually below.
```
OR manual installation:
```
- Import file sql database/s-cart.sql to database.
- Rename file .env.example to .env if file .env not exist.
- Genarate API key if APP_KEY is null. Use command "php artisan key:generate"
- Config value of file .env:
    APP_URL=http://localhost
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=s-cart
    DB_USERNAME=root
    DB_PASSWORD=
```

Step5:

NOTE: Please <b>remove</b> or <b>rename</b> file public/install.php so others cannot access it.

Step6:
- Access to url admin: your-domain/system_admin.
- User/pass <code><b>admin</b>/<b>admin</b></code>

## Demo:

- Font-end : http://demo.s-cart.org
- Back-end: http://demo.s-cart.org/system_admin   <code>User/pass: test/123456</code>


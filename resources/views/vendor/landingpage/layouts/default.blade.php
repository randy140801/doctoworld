<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="favicon.png" type="image/x-icon">
    
    <title>@yield('title')</title>

    @yield('meta')
    
    @section('css')
    <link rel="stylesheet" href="assets/vendor/landingpage/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/landingpage/vendors/bootstrap-selector/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="assets/vendor/landingpage/vendors/themify-icon/themify-icons.css">
    <link rel="stylesheet" href="assets/vendor/landingpage/vendors/elagent/style.css">
    <link rel="stylesheet" href="assets/vendor/landingpage/vendors/font-awesome/css/all.css">
    <link rel="stylesheet" href="assets/vendor/landingpage/vendors/flaticon/flaticon.css">
    <link rel="stylesheet" href="assets/vendor/landingpage/vendors/animation/animate.css">
    <link rel="stylesheet" href="assets/vendor/landingpage/vendors/owl-carousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/vendor/landingpage/vendors/magnify-pop/magnific-popup.css">
    <link rel="stylesheet" href="assets/vendor/landingpage/vendors/nice-select/nice-select.css">
    <link rel="stylesheet" href="assets/vendor/landingpage/vendors/scroll/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="assets/vendor/landingpage/css/style.css">
    <link rel="stylesheet" href="assets/vendor/landingpage/css/responsive.css">
    @show
</head>

<body>
    @yield('content')

    @section('js')
    <script src="assets/vendor/landingpage/js/jquery-3.2.1.min.js"></script>
    <script src="assets/vendor/landingpage/js/propper.js"></script>
    <script src="assets/vendor/landingpage/js/bootstrap.min.js"></script>
    <script src="assets/vendor/landingpage/vendors/bootstrap-selector/js/bootstrap-select.min.js"></script>
    <script src="assets/vendor/landingpage/vendors/wow/wow.min.js"></script>
    <script src="assets/vendor/landingpage/vendors/sckroller/jquery.parallax-scroll.js"></script>
    <script src="assets/vendor/landingpage/vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="assets/vendor/landingpage/vendors/nice-select/jquery.nice-select.min.js"></script>
    <script src="assets/vendor/landingpage/vendors/imagesloaded/imagesloaded.pkgd.min.js"></script>
    <script src="assets/vendor/landingpage/vendors/isotope/isotope-min.js"></script>
    <script src="assets/vendor/landingpage/vendors/magnify-pop/jquery.magnific-popup.min.js"></script>
    <script src="assets/vendor/landingpage/js/plugins.js"></script>
    <script src="assets/vendor/landingpage/vendors/scroll/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="assets/vendor/landingpage/js/main.js"></script>
    @show
</body>

</html>
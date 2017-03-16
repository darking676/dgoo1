<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="ko"> <!--<![endif]-->  
<%@ include file="/WEB-INF/include/include-header-template.jspf" %>    
<%@ include file="/WEB-INF/include/include-header-script.jspf" %>    
<head>
    <title>Shop UI | Unify - Responsive Website Template</title>

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="assets/plugins/animate.css">    
    <link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings.css">
</head>	

    
<body class = "header-fixed">
<div class = "wrapper">
		<!--=== Product Content ===-->
		<div class="container content-md">
			<div class="heading heading-v1 margin-bottom-20">
				<h2>쿠폰 & 이벤트</h2> 
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed
					odio elit, ultrices vel cursus sed, placerat ut leo. Phasellus in
					magna erat. Etiam gravida convallis augue non tincidunt. Nunc
					lobortis dapibus neque quis lacinia. Nam dapibus tellus sit amet
					odio venenatis</p>
			</div>

			<!--=== Illustration v2 ===-->
			<div class="illustration-v2 margin-bottom-60">
				<div class="customNavigation margin-bottom-25">
ㅎㅇㅎㅇㅎㅇ 
				</div>

				<ul class="list-inline owl-slider">
					<!-- =====================================promotion list===================================== -->
					<li class="item">
						<div class="product-img">
							<a href="shop-ui-inner.html">
								<img class="full-width img-responsive" src="${s.p_img }"alt=""></a>
								<a class="product-review" href="shop-ui-inner.html">Quick review</a>
								<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
							<div class="shop-rgba-dark-green rgba-banner">Best</div>
						</div>
						<div class="product-description product-description-brd">
							<div class="overflow-h margin-bottom-5">
								<div class="pull-left">
									<h4 class="title-price">
										${s.p_name }
									</h4>
									<span class="gender text-uppercase">${gender }</span> 
									<span class="gender">${s.p_sort } - ${s.p_category }</span>
								</div>
								<div class="product-price">
									<span class="title-price">${s.p_price }</span>
								</div>
							</div>
							<ul class="list-inline product-ratings">
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li class="like-icon">
									<a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#">
										<i class="fa fa-heart"></i>
									</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="item">
						<div class="product-img">
							<a href="shop-ui-inner.html">
								<img class="full-width img-responsive" src="${s.p_img }"alt=""></a>
								<a class="product-review" href="shop-ui-inner.html">Quick review</a>
								<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
							<div class="shop-rgba-dark-green rgba-banner">Best</div>
						</div>
						<div class="product-description product-description-brd">
							<div class="overflow-h margin-bottom-5">
								<div class="pull-left">
									<h4 class="title-price">
										${s.p_name }
									</h4>
									<span class="gender text-uppercase">${gender }</span> 
									<span class="gender">${s.p_sort } - ${s.p_category }</span>
								</div>
								<div class="product-price">
									<span class="title-price">${s.p_price }</span>
								</div>
							</div>
							<ul class="list-inline product-ratings">
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li class="like-icon">
									<a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#">
										<i class="fa fa-heart"></i>
									</a>
								</li>
							</ul>
						</div>
					</li>
					<!-- ================================================================================== -->
					
				</ul>
			</div>
			<!--=== End Illustration v2 ===-->
	</div>
	<!--/wrapper-->
<%@ include file="/WEB-INF/include/include-footer-template.jspf" %> 
</div>  
<%@ include file="/WEB-INF/include/include-body.jspf" %>  
<!-- JS Implementing Plugins -->
<script src="assets/plugins/back-to-top.js"></script>
<script src="assets/plugins/smoothScroll.js"></script>
<script src="assets/plugins/jquery.parallax.js"></script>
<script src="assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
<script src="assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

<!-- JS Page Level -->
<script src="assets/js/shop.app.js"></script>
<script src="assets/js/plugins/owl-carousel.js"></script>
<script src="assets/js/plugins/revolution-slider.js"></script>
<script>
    jQuery(document).ready(function() {
        App.init();
        App.initScrollBar();
        App.initParallaxBg();
        OwlCarousel.initOwlCarousel();
        RevolutionSlider.initRSfullWidth();
        

       expireDate = new Date 
       expireDate.setMonth(expireDate.getMonth()+6) 
       hitCt = eval(cookieVal("pageHit")) 
       hitCt++ 
       document.cookie = "pageHit="+hitCt+";expires=" + expireDate.toGMTString() 
       
       function cookieVal(cookieName) { 
          thisCookie = document.cookie.split("; ") 
          for (i=0; i<thisCookie.length; i++) { 
             if (cookieName == thisCookie[i].split("=")[0]) { 
             return thisCookie[i].split("=")[1] 
             } 
          } 
       return 0 
       }
       
      $("#guestcount").val(hitCt)
});
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/js/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</body>


</html> 
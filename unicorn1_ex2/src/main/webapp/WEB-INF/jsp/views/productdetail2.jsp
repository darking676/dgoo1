<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<!DOCTYPE html>
<html>
	<%@ include file="/WEB-INF/include/include-header-template.jspf" %>  
	<%@ include file="/WEB-INF/include/include-header-script.jspf" %>
<head>
    <title>Product Details | Unify - Responsive Website Template</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/shop.style.css">
    
    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="assets/css/headers/header-v5.css">
    <link rel="stylesheet" href="assets/css/footers/footer-v4.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="assets/plugins/animate.css">    
    <link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
    <link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
    <link rel="stylesheet" href="assets/plugins/master-slider/quick-start/masterslider/style/masterslider.css">
    <link rel='stylesheet' href="assets/plugins/master-slider/quick-start/masterslider/skins/default/style.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="assets/css/custom.css">
    <style type="text/css">
		#src0{width: 100px; height: 180px;}
		#src1{width: 220px; height: 160px;}
		#src2{width: 200px; height: 220px;}
		#src3{width: 240px; height: 220px;}
		#src4{width: 200px; height: 200px;}
		#src5{width: 150px; height: 220px;}
		#src6{width: 150px; height: 140px;}
		#src7{width: 180px; height: 240px;}
		#src8{width: 200px; height: 150px;}
		#src9{width: 180px; height: 240px;}
	</style>
	<style type="text/css">
		.prd_title{
		text-align: center;
		}
		.ctgr{
			font-size: 20px;
		}
		.tit{
		border: thin;
		font-size: 50px;
		color: black;
		}
		.product_desc{
			border:5px;
			margin-top:30px;
			width: 100%;
			text-align: center;
		}
		.desc{
			width:1000px;
			text-align: left;
			margin: auto;
			font-style: !important, bold;
		}
	</style>

</head> 

<body class="header-fixed">
<%@ include file="/WEB-INF/include/include-body.jspf" %>    
<div class="wrapper">
    <!--=== Shop Product ===-->
    <div class="shop-product">
        <!-- Breadcrumbs v5 -->
        <div class="container">
            <ul class="breadcrumb-v5">
                <li><a href="index.html"><i class="fa fa-home"></i></a></li>
                <li><a href="#">Products</a></li>
                <li class="active">New</li>
            </ul> 
        </div>
        <!-- End Breadcrumbs v5 -->

        <div class="container">
            <div class="row">
                <div class="col-md-6 md-margin-bottom-50">
                    <div class="ms-showcase2-template">
                        <!-- Master Slider -->
                        <div id="masterslider">
                            <div class="ms-slide">
                                <img data-src="${dto.p_img }">
                            </div>
                        </div>
                        <!-- End Master Slider -->
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="shop-product-heading">
                        <h2>${dto.p_name }</h2>
                        <ul class="list-inline shop-product-social">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                        </ul>
                    </div><!--/end shop product social-->

                    <ul class="list-inline product-ratings margin-bottom-30">
                        <li><i class="rating-selected fa fa-star"></i></li>
                        <li><i class="rating-selected fa fa-star"></i></li>
                        <li><i class="rating-selected fa fa-star"></i></li>
                        <li><i class="rating fa fa-star"></i></li>
                        <li><i class="rating fa fa-star"></i></li>
                        <li class="product-review-list">
                            <span>(1) <a href="#">Review</a> | <a href="#"> Add Review</a></span>
                        </li>
                    </ul><!--/end shop product ratings-->
					<!-- 
                    <p>Integer <strong>dapibus ut elit</strong> non volutpat. Integer auctor purus a lectus suscipit fermentum. Vivamus lobortis nec erat consectetur elementum.</p><br>
                    <p>${ele_desc}</p><br>
					 -->
					 
                    <ul class="list-inline shop-product-prices margin-bottom-30">
                        <li class="shop-red">${dto.p_price }원</li>
                    </ul><!--/end shop product prices-->

                    <h3 class="shop-product-title">Size</h3>
                    <ul class="list-inline product-size margin-bottom-30">
                    	<c:set var="a" value="1"></c:set>
                    	<c:forEach items="${optionlist}" var="c" varStatus="status">
                        <li id="search">
                            <input type="radio" id="size-${a}" name="size" value="${c.po_stock}">
                            <label for="size-${a}" id="size-${a}">
                            <c:choose>
                            	<c:when test="${c.po_size eq 1 }">
                            		Fr
                            	</c:when>
                            	<c:otherwise>
                            		${c.po_size }	
                            	</c:otherwise>
                            </c:choose>
                            </label>
                        </li>
                        <c:set var="a" value="${a+1}" />
                        </c:forEach>
                    </ul><!--/end product size-->
                    <!-- form -->
                    
                  	<input type="hidden" name="p_id" value="${dto.p_id }">
	                <input type="hidden" name="p_name" value="${dto.p_name }">
	                <input type="hidden" name="p_img" value="${dto.p_img }">
	                <input type="hidden" name="p_sex" value="${dto.p_sex }">
	                <input type="hidden" name="p_price" value="${dto.p_price }">
	                
                    <!-- ## -->
                    <h3 class="shop-product-title">Quantity</h3>
                    <div class="margin-bottom-40">
                        <form name="f1" class="product-quantity sm-margin-bottom-20">
                            <button type='button' class="quantity-button" name='subtract' onclick='javascript: subtractQty();' value='-'>-</button>
                            <input type="text" class="quantity-field" name='qty' value="1" id='qty'/>
                            <button type='button' class="quantity-button" name='add' value='+'>+</button>                           		
                        </form>
                        <button type="button" class="btn-u btn-u-sea-shop btn-u-lg" onclick = "javascript:fn_go_cart(this)">Add to Cart</button>
                    </div><!--/end product quantity-->    

                    <ul class="list-inline add-to-wishlist add-to-wishlist-brd">
                        <li class="wishlist-in">
                            <i class="fa fa-heart"></i>
                            <a href="#" name="wishlist">Add to Wishlist</a>
                        </li>
                    </ul>    
                    <p class="wishlist-category"><strong>Categories:</strong> <a href="#">Clothing,</a> <a href="#">Shoes</a></p>
                </div>
            </div><!--/end row-->
        </div>    
    </div>
    <!--=== End Shop Product ===-->
    <div class="product_desc">
    ${ele_title}
    ${ele_desc}
    </div>
    <hr>
<!-- blog pasing -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
<link rel="stylesheet" href="https://raw.github.com/blueimp/Bootstrap-Image-Gallery/master/css/bootstrap-image-gallery.css">
<link rel="stylesheet" href="https://raw.github.com/blueimp/Bootstrap-Image-Gallery/master/css/demo.css">
<c:set var="d" value="0"/>
	<div style="text-align: center;">
    	<p style="font-size: 50px; color: green;">NAVER 블로그 데이터</p>
    </div>
<c:forEach begin="0" end="${f:length(list)}" step="1">
<div class="container" style="width: 700px;">
    <br>
    <!-- The container for the list of example images -->
    <div id="links">
    	<c:set var="c" value="0"/>
		<c:forEach var="s" begin="0" end="8" items="${list[d]}">
			<a data-gallery="" title="Natalia" href="${s}">
				<img src="${s}" id="src${c}">
			</a>
		<c:set var="c" value="${c+1}"/>
		</c:forEach>
		<hr>
		<c:set var="d" value="${d+1}" />
	</div>
    <br>
</div>
</c:forEach>

<div id="blueimp-gallery" class="blueimp-gallery">
    <!-- The container for the modal slides -->
    <div class="slides"></div>
    <!-- Controls for the borderless lightbox -->
    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
    <!-- The modal dialog, which will be used to wrap the lightbox content -->
    <div class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-hidden="true">×</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body next"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left prev">
                        <i class="glyphicon glyphicon-chevron-left"></i>
                        Previous
                    </button>
                    <button type="button" class="btn btn-primary next">
                        Next
                        <i class="glyphicon glyphicon-chevron-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<!-- Bootstrap JS is not required, but included for the responsive demo navigation and button states -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
<script src="http://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
<script src="https://raw.github.com/blueimp/Bootstrap-Image-Gallery/master/js/bootstrap-image-gallery.js"></script>
<script src="https://raw.github.com/blueimp/Bootstrap-Image-Gallery/master/js/demo.js"></script>

<!-- blog pasing End -->
    <!--=== Content Medium ===-->
    <div class="content-md container">
        <!--=== Product Service ===-->
        <div class="row margin-bottom-60">
            <div class="col-md-4 product-service md-margin-bottom-30">
                <div class="product-service-heading">
                    <i class="fa fa-truck"></i>
                </div>
                <div class="product-service-in">
                    <h3>Free Delivery</h3>
                    <p>Integer mattis lacinia felis vel molestie. Ut eu euismod erat, tincidunt pulvinar semper veliUt porta, leo...</p>
                    <a href="#">+Read More</a>
                </div>
            </div>
            <div class="col-md-4 product-service md-margin-bottom-30">
                <div class="product-service-heading">
                    <i class="icon-earphones-alt"></i>
                </div>
                <div class="product-service-in">
                    <h3>Customer Service</h3>
                    <p>Integer mattis lacinia felis vel molestie. Ut eu euismod erat, tincidunt pulvinar semper veliUt porta, leo...</p>
                    <a href="#">+Read More</a>
                </div>
            </div>
            <div class="col-md-4 product-service">
                <div class="product-service-heading">
                    <i class="icon-refresh"></i>
                </div>
                <div class="product-service-in">
                    <h3>Free Returns</h3>
                    <p>Integer mattis lacinia felis vel molestie. Ut eu euismod erat, tincidunt pulvinar semper veliUt porta, leo...</p>
                    <a href="#">+Read More</a>
                </div>
            </div>
        </div><!--/end row-->
        <!--=== End Product Service ===-->

        <div class="tab-v5">
            <ul class="nav nav-tabs" role="tablist">
            <!-- 
                <li class="active"><a href="#description" role="tab" data-toggle="tab">Description</a></li>
             -->
                <li><a href="#reviews" role="tab" data-toggle="tab">Reviews (${rvlistSize})</a></li>
            </ul>

            <div class="tab-content">
                <!-- Description -->
                <!-- 
                <div class="tab-pane fade in active" id="description">
                    <div class="row">
                        <div class="col-md-7">
                            <p>Morbi non semper est, eget tincidunt turpis. Vivamus sollicitudin sodales nisi, et venenatis turpis Vivamus sollicitudin ultricies eget. Fusce vitae neque blandit lectus faucibus aliquet nec vel ipsum. Integer mattis lacinia felis vel sollicitudin molestie.</p><br>

                            <h3 class="heading-md margin-bottom-20">Specifies</h3>
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled specifies-list">
                                        <li><i class="fa fa-caret-right"></i>Brand Name: <span>Lacoste</span></li>
                                        <li><i class="fa fa-caret-right"></i>Technics: <span>Computer</span> Knitted</li>
                                        <li><i class="fa fa-caret-right"></i>Sleeve Length: <span>Full</span></li>
                                        <li><i class="fa fa-caret-right"></i>Sleeve Style: <span>Regular</span></li>
                                        <li><i class="fa fa-caret-right"></i>Pattern Type: <span>PAID</span></li>
                                        <li><i class="fa fa-caret-right"></i>Style: <span>Casual</span></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled specifies-list">
                                        <li><i class="fa fa-caret-right"></i>Material: <span>Cotton,Nylon</span></li>
                                        <li><i class="fa fa-caret-right"></i>Item Type: <span>Pullovers</span></li>
                                        <li><i class="fa fa-caret-right"></i>Thickness: <span>Thin</span></li>
                                        <li><i class="fa fa-caret-right"></i>Model Number: <span>TM-11013 </span></li>
                                        <li><i class="fa fa-caret-right"></i>Gender: <span>Men</span></li>
                                        <li><i class="fa fa-caret-right"></i>MATERIAL: <span>80%COTTON+10%NYLON</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="responsive-video">
                                <iframe src="//player.vimeo.com/video/72343553" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
                            </div>
                        </div>
                    </div>
                </div>
                 -->
                <!-- End Description -->
				
				
                <!-- Reviews -->                
               <div id="reviews">
                    <div class="product-comment margin-bottom-40">
                    <c:if test="${f:length(reviewList) > 0 }">
                       <c:forEach var="re" items="${reviewList}">
                                 <c:if test="${re.rv_lvl == 0 }">
                              <div class="product-comment-in">
                                 <div class="product-comment-dtl">
                                    <input type="hidden" name="rv_index" value="${re.rv_index }">
                                    <input type="hidden" name="rv_gnum" value="${re.rv_gnum }">
                                    <h4>${re.rv_userid}
                                       <small>${re.rv_regdate}</small>
                                    </h4>
                                    <p>${re.rv_content }</p>
                                    <ul class="list-inline product-ratings">
                                       <li class="pull-right">
                                          <ul class="list-inline">
                                             <c:forEach begin="1" end="${re.rv_rate}">
                                                <li><i class="rating-selected fa fa-star"></i></li>
                                             </c:forEach>
                                             <c:forEach begin="1" end="${5 - re.rv_rate}">
                                                <li><i class="rating fa fa-star"></i></li>
                                             </c:forEach>
                                          </ul>
                                       </li>
                                    </ul>
                                 </div>
                              </div>
                           </c:if>
                                 <c:if test="${re.rv_lvl == 1 }">
                              <div class="product-comment-in">
                                 <div class="product-comment-dtl">
                                    <input type="hidden" name="rv_index" value="${re.rv_index }">
                                    <input type="hidden" name="rv_gnum" value="${re.rv_gnum }">
                                    <h5 style="color: red;">
                                       <i class="glyphicon glyphicon-arrow-right lg"></i>
                                       ${re.rv_userid}
                                    </h5>
                                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${re.rv_content }</p>
                                 </div>
                              </div>
                           </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${f:length(reviewList) < 1 }">
                        <div class="product-comment-in">
                            <div class="product-comment-dtl">
                               <h4 style="text-align: center;">등록된 리뷰가 없습니다</h4>
                            </div>
                        </div>   
                    </c:if>
                    </div>
                    <!-- /////////////////////////////////////////////////////////////////////////////////////// -->
                    <div class="write-review" style="display: none;">
                    <h3 class="heading-md margin-bottom-30">Add a review</h3>
                    <form action="insertReview.do" method="post" id="sky-form3" class="sky-form sky-changes-4">
                        <fieldset>
                            <div class="margin-bottom-30">
                                <label class="label-v2">Name : ${userid}</label>
                            </div>
                            <div class="margin-bottom-30">
                                <label class="label-v2">Review</label>
                                <label class="textarea">
                                    <textarea rows="7" name="message" id="message"></textarea>
                                </label>
                            </div>    
                        </fieldset>    
                            
                        <footer class="review-submit">
                            <label class="label-v2">Review</label>
                            <div class="stars-ratings">
                                <input type="radio" name="stars-rating" id="stars-rating-5">
                                <label for="stars-rating-5"><i class="fa fa-star"></i></label>
                                <input type="radio" name="stars-rating" id="stars-rating-4">
                                <label for="stars-rating-4"><i class="fa fa-star"></i></label>
                                <input type="radio" name="stars-rating" id="stars-rating-3">
                                <label for="stars-rating-3"><i class="fa fa-star"></i></label>
                                <input type="radio" name="stars-rating" id="stars-rating-2">
                                <label for="stars-rating-2"><i class="fa fa-star"></i></label>
                                <input type="radio" name="stars-rating" id="stars-rating-1">
                                <label for="stars-rating-1"><i class="fa fa-star"></i></label>
                            </div>
                            <button type="button" class="btn-u pull-right" id="submit">Submit</button>
                        </footer>
                    </form>
                    </div>
                    <!-- /////////////////////////////////////////////////////////////////////////////////////// -->
                </div>
                <!-- End Reviews -->                
            </div>
        </div>
    </div><!--/end container--> 
    <%@ include file="/WEB-INF/include/include-footer-template.jspf" %>  <!-- /wrapper 보다 무조건 상단에 include-->     
</div><!--/wrapper-->
<input type="hidden" id="user_id" value="${userid}">
<!-- JS Global Compulsory -->           
<script src="assets/plugins/jquery/jquery.min.js"></script>
<script src="assets/plugins/jquery/jquery-migrate.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script src="assets/plugins/back-to-top.js"></script>
<script src="assets/plugins/smoothScroll.js"></script>
<script src="assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
<script src="assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Master Slider -->
<script src="assets/plugins/master-slider/quick-start/masterslider/masterslider.min.js"></script>
<script src="assets/plugins/master-slider/quick-start/masterslider/jquery.easing.min.js"></script>
<!-- JS Customization -->
<script src="assets/js/custom.js"></script>
<!-- JS Page Level -->
<script src="assets/js/shop.app.js"></script>
<script src="assets/js/plugins/owl-carousel.js"></script>
<script src="assets/js/plugins/master-slider.js"></script>
<script src="assets/js/forms/product-quantity.js"></script>
<script>
    jQuery(document).ready(function() {
    	
    	var delay = 1000;
    	var submitted = false;
    	
    	$("a[name='wishlist']").on("click", function(e){
    		e.preventDefault();
    		fn_add_wish();
    	});
    	$("button[id='submit']").one("click",function(e){
    		if(submitted == true) { return; }
			e.preventDefault();
			$(this).removeAttr('href');
    		
    		if($("input[name='stars-rating']:checked").attr("id") == undefined){
               alert("별점을 선택해주세요");
                return;
             }else if($("textarea[name='message']").val() == ""){
                alert("내용을 입력해주세요");
                return;
             }
            
            $.ajax({  
                   type:"POST",
                   url: "insertReview.do",
                   data: {
                      "rv_pid":$('input[name=p_id]').val(),
                      "rv_content":$("textarea[name='message']").val(),
                      "rv_userid":"${userid}",
                 "rv_rate":$("input[name='stars-rating']:checked").attr("id")
                 },
                   success:function(data){
                	   setTimeout (location.reload(), delay);
                	   submitted = true;
                   },
                   error:function(e){  
                       alert("에러ㄷㄷ");
                        location.reload();
                   }  
              });
         });
    	
    	if("${userid}" != null || "${userid}" != ""){	//로그인 상태이고
    		if("${authority}" == "O"){	//권한이 있을 경우
    			$(".write-review").show();	//글 쓰는 div를 보여준다
    		}
    	}
    	
        App.init();
        App.initScrollBar();        
        OwlCarousel.initOwlCarousel();
        MasterSliderShowcase2.initMasterSliderShowcase2();
        
        //alert("aa");
        $('button[name="add"]').one("click", function(e){
        	var maxValue = $('input:radio[name="size"]:checked').val();
        	if(maxValue == null){
        		alert("사이즈 선택하세요")
        		return;
        	}else{
        		if(document.getElementById("qty").value != maxValue){
        			document.getElementById("qty").value++;	
        		}else{
        			alert("선택가능한 수량은 " + $('input:radio[name="size"]:checked').val() + "개 입니다");
        		}
        	}
		
    	});
        
    });
    
	String.prototype.replaceAll = function(org, dest) {
	    return this.split(org).join(dest);
	}
    
    function fn_go_cart(a) {	
    	var maxValue = $('input:radio[name="size"]:checked').attr('id');
    	//alert($('label[id=' + maxValue + ']').text().trim());
    	//alert($('input[name=p_sex]').val());
    	//alert($('input[name=p_name]').val())
		var before_p_name = $('input[name=p_name]').val();
		var p_name = before_p_name.replaceAll("'","\"");
		var comSubmit = new ComSubmit();
		if ($("#user_id").val() == "") {
			alert("로그인 후 서비스 이용가능");
			comSubmit.setUrl("<c:url value='/Login.do' />");
			comSubmit.submit();
			return;
		} else {
			if (confirm("담으시겠습니까?")) {
				$.ajax({  
          	        type:"POST",
          	        url: "addToCart.do",
          	        data: {
          	        	"p_id":$('input[name=p_id]').val(),
          	        	"p_name":p_name,
						"p_img":$('input[name=p_img]').val(),
						"p_sex":$('input[name=p_sex]').val(),
						"p_number":$('#qty').val(),
						"po_size":$('label[id=' + maxValue + ']').text().trim(),
						"p_price":$('input[name=p_price]').val()
						},
          	        success:function(data){
          	            location.reload();
          	        },
          	        error:function(e){  
          	            alert(e.responseText);  
          	        }  
      	       });
			} else {
				return;
			}
		}
	}
    function fn_add_wish(){
    	var maxValue = $('input:radio[name="size"]:checked').attr('id');
    	var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/detailWishlist.do' />");
			comSubmit.addParam("wish_p_id", $("input[name='p_id']").val());
			comSubmit.addParam("wish_size", $('label[id=' + maxValue + ']').text().trim());
			comSubmit.addParam("wish_number", $('#qty').val());
			comSubmit.submit();
    }
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="ko"> <!--<![endif]-->
<%@ include file="/WEB-INF/include/include-header-template.jspf" %>  
<%@ include file="/WEB-INF/include/include-header-script.jspf" %> 
<style type="text/css">

body{
  animation-duration: 0.5s;
  animation-name: slidein;
}

@keyframes slidein {
  from {
    margin-left: 100%;
    width: 300%
  }

  to {
    margin-left: 0%;
    width: 100%;
  }
}
</style> 
<head>
    <title>Product Grid | Unify - Responsive Website Template</title>
    
    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="assets/plugins/animate.css">    
    <link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="noUiSlider.9.0.0/nouislider.css">
	<link rel="stylesheet" href="noUiSlider.9.0.0/nouislider.min.css">

</head> 
<body class="header-fixed">
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<div class="wrapper">
    <!--=== Breadcrumbs v4 ===-->
    <div class="breadcrumbs-v4">
        <div class="container">
            <span class="page-name">상품 페이지</span>
            <h1><span class="shop-green">adidas</span> product</h1>
            <ul class="breadcrumb-v4-in">
                <li><a href="home.do">홈</a></li>
                <li class="active">상품</li>
            </ul>
        </div><!--/end container-->
    </div> 
    <!--=== End Breadcrumbs v4 ===-->

    <!--=== Content Part ===-->
    <div class="content container">
        <div class="row">
            <div class="col-md-3 filter-by-block md-margin-bottom-60">
                <h1 class="filterBy">Filter By</h1>  
                <div class="panel-group" id="accordion-v2">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion-v2" href="#collapseTwo">
                                분류
                                    <i class="fa fa-angle-down"></i>
                                </a>
                            </h2>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <ul class="list-unstyled checkbox-list">
                                    <li>
                                        <label class="checkbox" >
                                            <input type="checkbox" name="sort-checkbox" id="의류" onclick="sortCheck('의류')"/>
                                            <i></i>
                                        의류
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="sort-checkbox" id="용품"  onclick="sortCheck('용품')"/>
                                            <i></i>
                                        용품
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="sort-checkbox" id="신발" onclick="sortCheck('신발')"/>
                                            <i></i>
                                        신발
                                        </label>
                                    </li>
                                </ul>        
                            </div>
                        </div>
                    </div>
                </div><!--/end panel group-->

                <div class="panel-group" id="accordion-v3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion-v3" href="#collapseThree">
                                카테고리
                                    <i class="fa fa-angle-down"></i>
                                </a>
                            </h2>
                        </div>
                        
                       <c:if test="${param.p_sex == '0, 1' }">
                        	<c:if test="${param.p_sort == '신발' }">
                        	<div id="collapseThree" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <ul class="list-unstyled checkbox-list">
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="오리지널스" onclick="categoryCheck('오리지널스')"/>
                                            <i></i>
                                        오리지널스
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="러닝" onclick="categoryCheck('러닝')"/>
                                            <i></i>
                                        러닝
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="농구" onclick="categoryCheck('농구')"/>
                                            <i></i>
                                        농구
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="아웃도어" onclick="categoryCheck('아웃도어')"/>
                                            <i></i>
                                        아웃도어
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="축구" onclick="categoryCheck('축구')"/>
                                            <i></i>
                                        축구
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="네오" onclick="categoryCheck('네오')"/>
                                            <i></i>
                                        네오
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="테니스" onclick="categoryCheck('테니스')"/>
                                            <i></i>
                                        테니스
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="트레이닝" onclick="categoryCheck('트레이닝')"/>
                                            <i></i>
                                        트레이닝
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="야구" onclick="categoryCheck('야구')"/>
                                            <i></i>
                                        야구
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="스윙" onclick="categoryCheck('스윙')"/>
                                            <i></i>
                                        스윙
                                        </label>
                                    </li>
                                </ul>        
                            </div>
                        </div>
                        </c:if>
                        <c:if test="${param.p_sort == '의류'}">
                        <div id="collapseThree" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <ul class="list-unstyled checkbox-list">
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="윈터자켓"  onclick="categoryCheck('윈터자켓')"/>
                                            <i></i>
                                        윈터자켓
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="자켓"  onclick="categoryCheck('자켓')"/>
                                            <i></i>
                                        자켓
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="트랙탑/져지탑"  onclick="categoryCheck('트랙탑/져지탑')" />
                                            <i></i>
                                        트랙탑/져지탑
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="긴팔티"  onclick="categoryCheck('긴팔티')"/>
                                            <i></i>
                                        긴팔티
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="반팔티"  onclick="categoryCheck('반팔티')"/>
                                            <i></i>
                                        반팔티
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="슬리브리스"  onclick="categoryCheck('슬리브리스')"/>
                                            <i></i>
                                        슬리브리스
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="팬츠"  onclick="categoryCheck('팬츠')"/>
                                            <i></i>
                                        팬츠
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="숏팬츠/타이즈"  onclick="categoryCheck('숏팬츠/타이즈')"/>
                                            <i></i>
                                        숏팬츠/타이즈
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="기타"  onclick="categoryCheck('기타')"/>
                                            <i></i>
                                        기타
                                        </label>
                                    </li>
                                </ul>        
                            </div>
                        </div>
                        </c:if>
                        <c:if test="${param.p_sort == '용품' }">
                        	<div id="collapseThree" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <ul class="list-unstyled checkbox-list">
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="양말" onclick="categoryCheck('양말')"/>
                                            <i></i>
                                        양말
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="디지털 액세서리" onclick="categoryCheck('디지털 액세서리')"/>
                                            <i></i>
                                        디지털 액세서리
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="모자" onclick="categoryCheck('모자')"/>
                                            <i></i>
                                        모자
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="가방"  onclick="categoryCheck('가방')"/>
                                            <i></i>
                                        가방
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="공/피트니스 용품"  onclick="categoryCheck('공/피트니스 용품')"/>
                                            <i></i>
                                        공/피트니스 용품
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="기타" onclick="categoryCheck('기타')" />
                                            <i></i>
                                        기타
                                        </label>
                                    </li>
                                </ul>        
                            </div>
                        </div>
                        </c:if>
                       </c:if>
                       <c:if test="${param.p_sex == '0, 2' }">
                        	<c:if test="${param.p_sort == '신발' }">
                        		<div id="collapseThree" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <ul class="list-unstyled checkbox-list">
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="오리지널스" onclick="categoryCheck('오리지널스')"/>
                                            <i></i>
                                        오리지널스
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="러닝" onclick="categoryCheck('러닝')"/>
                                            <i></i>
                                        러닝
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="아웃도어" onclick="categoryCheck('아웃도어')"/>
                                            <i></i>
                                        아웃도어
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="트레이닝" onclick="categoryCheck('트레이닝')"/>
                                            <i></i>
                                        "트레이닝"
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="야구" onclick="categoryCheck('야구')"/>
                                            <i></i>
                                        야구
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="테니스" onclick="categoryCheck('테니스')"/>
                                            <i></i>
                                        테니스
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="스윙" onclick="categoryCheck('스윙')"/>
                                            <i></i>
                                        스윙
                                        </label>
                                    </li>
                                </ul>        
                            </div>
                        </div>
                        	</c:if>
                        	<c:if test="${param.p_sort == '의류' }">
                        		<div id="collapseThree" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <ul class="list-unstyled checkbox-list">
                                	<li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="브라탑" onclick="categoryCheck('브라탑')"/>
                                            <i></i>
                                        브라탑
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="윈터자켓" onclick="categoryCheck('윈터자켓')"/>
                                            <i></i>
                                        윈터자켓
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="슬리브리스" onclick="categoryCheck('슬리브리스')"/>
                                            <i></i>
                                        슬리브리스
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="반팔티" onclick="categoryCheck('반팔티')"/>
                                            <i></i>
                                        반팔티
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="긴팔티" onclick="categoryCheck('긴팔티')"/>
                                            <i></i>
                                        긴팔티
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="트랙탑/져지탑" onclick="categoryCheck('트랙탑/져지탑')" />
                                            <i></i>
                                        트랙탑/져지탑
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="자켓" onclick="categoryCheck('자켓')"/>
                                            <i></i>
                                        자켓
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="숏팬츠/타이즈" onclick="categoryCheck('숏팬츠/타이즈')"/>
                                            <i></i>
                                        숏팬츠/타이즈
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="팬츠" onclick="categoryCheck('팬츠')"/>
                                            <i></i>
                                        팬츠
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="스커트/원피스" onclick="categoryCheck('스커트/원피스')"/>
                                            <i></i>
                                        스커트/원피스
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="기타" onclick="categoryCheck('기타')"/>
                                            <i></i>
                                        기타
                                        </label>
                                    </li>
                                </ul>        
                            </div>
                        </div>
                        	</c:if>
                        	<c:if test="${param.p_sort == '용품' }">
                        		<div id="collapseThree" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <ul class="list-unstyled checkbox-list">
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="디지털 액세서리" onclick="categoryCheck('기타')"/>
                                            <i></i>
                                        디지털 액세서리
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="모자" onclick="categoryCheck('모자')"/>
                                            <i></i>
                                        모자
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="가방" onclick="categoryCheck('가방')"/>
                                            <i></i>
                                        가방
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="공/피트니스 용품" onclick="categoryCheck('공/피트니스 용품')"/>
                                            <i></i>
                                        공/피트니스 용품
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="기타" onclick="categoryCheck('기타')"/>
                                            <i></i>
                                        기타
                                        </label>
                                    </li>
                                </ul>        
                            </div>
                        </div>
                        	</c:if>
                       </c:if>
                       <c:if test="${param.p_sex == '3' }">
                       	 <c:if test="${param.p_sort == '신발' }">
                       	 	<div id="collapseThree" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <ul class="list-unstyled checkbox-list">
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="오리지널스" onclick="categoryCheck('오리지널스')"/>
                                            <i></i>
                                        오리지널스
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="트레이닝" onclick="categoryCheck('트레이닝')"/>
                                            <i></i>
                                        트레이닝
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="스윙" onclick="categoryCheck('스윙')"/>
                                            <i></i>
                                        스윙
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="축구"  onclick="categoryCheck('축구')"/>
                                            <i></i>
                                        축구
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="러닝"  onclick="categoryCheck('러닝')"/>
                                            <i></i>
                                        러닝
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="농구" onclick="categoryCheck('농구')"/>
                                            <i></i>
                                        농구
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="아웃도어" onclick="categoryCheck('아웃도어')"/>
                                            <i></i>
                                        아웃도어
                                        </label>
                                    </li>
                                </ul>        
                            </div>
                        </div>
                       	 </c:if>
                       	 <c:if test="${param.p_sort == '의류' }">
                       	 	<div id="collapseThree" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <ul class="list-unstyled checkbox-list">
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="티셔츠" onclick="categoryCheck('티셔츠')"/>
                                            <i></i>
                                        티셔츠
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="팬츠" onclick="categoryCheck('팬츠')"/>
                                            <i></i>
                                        팬츠
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="상하의세트" onclick="categoryCheck('상하의세트')"/>
                                            <i></i>
                                        상하의세트
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="기타" onclick="categoryCheck('기타')"/>
                                            <i></i>
                                        기타
                                        </label>
                                    </li>
                                </ul>        
                            </div>
                        </div>
                       	 </c:if>
                       	 <c:if test="${param.p_sort == '용품' }">
                       	 	<div id="collapseThree" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <ul class="list-unstyled checkbox-list">
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="모자" onclick="categoryCheck('모자')" />
                                            <i></i>
                                        모자
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox" name="category-checkbox" id="가방" onclick="categoryCheck('가방')"/>
                                            <i></i>
                                        가방
                                        </label>
                                    </li>
                                </ul>        
                            </div>
                        </div>
                       	 </c:if>
                       </c:if>
                    </div>
                </div><!--/end panel group-->

                <div class="panel-group" id="accordion-v4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion-v4" href="#collapseFour">
                                    Price
                                    <i class="fa fa-angle-down"></i>
                                </a>
                            </h2>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse in">
                            <div class="panel-body" style="height: 90px;">
                                <div id="slider-snap" style="margin-top: 32px;"></div>
                                    <span id="slider-snap-value-lower" style="display: none;"></span>
                                    <span id="slider-snap-value-upper" style="display: none;"></span>    
                            </div>
                        </div>
                    </div>
                </div><!--/end panel group-->
            </div>

            <div class="col-md-9">
                <div class="row margin-bottom-5">
                    <div class="col-sm-4 result-category">
                        <h2>
                        <c:if test="${param.p_sex == '0, 1' }">
                        	MEN
                        </c:if>
                        <c:if test="${param.p_sex == '0, 2' }">
                        	WOMEN
                        </c:if>
                        <c:if test="${param.p_sex == '3' }">
                        	KIDS
                        </c:if>
                         <c:if test="${param.p_sex == '0, 1, 2, 3' }">
                        	ALL
                        </c:if>
						</h2>
                        <small class="shop-bg-red badge-results">${fn:length(list) } Results</small> 
                    </div>

                <div class="filter-results">
                <input type="hidden" name="sort" value="${param.p_sort}">
                <input type="hidden" name="category" value="${param.p_category}">
                <input type="hidden" name="start" value="${param.startPrice}">
                <input type="hidden" name="end" value="${param.endPrice}">
                <c:set var="i" value="0" />
                <c:set var="j" value="4" />
                <c:choose>
                   <c:when test="${list != null && fn:length(list) > 0 }">
                   	<c:set var="start" value="${(pageNum-1) * 100}"/>
                   	<c:set var="end" value="${(pageNum-1) * 100 + 99}"/>
                       <c:forEach var="p" items="${list }" varStatus="status" begin="${start }" end="${end }">
                       <c:if test="${i%j == 0 }">
                          <div class="row illustration-v2 margin-bottom-30">                       
                       </c:if>
                           <div class="col-md-3">
                               <div class="product-img product-img-brd">
                                   <a href="#"><img class="full-width img-responsive" src="${p.p_img }" alt=""></a>
                                   <a class="product-review" href="#this" name="detail">Quick review</a>
                                   <a class="add-to-cart" href="#this" name="addCart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                   <input type="hidden" id="p_id" value="${status.current.p_id }">
                                   <input type="hidden" id="user_id" value="${userid }">
                                   <input type="hidden" id="p_sex" value="${param.p_sex }">
                                   <div class="shop-rgba-dark-green rgba-banner">New</div>
                               </div> 
                               <div class="product-description product-description-brd margin-bottom-30">
                                   <div class="overflow-h margin-bottom-5">
                                       <div class="pull-left">
                                       <!-- 상품명 29자 넘어가는거 .. 처리 -->                               
                                        <c:if test="${fn:length(p.p_name) >28 }">
                                           <h4 class="title-price">
                                           <input type="hidden" id="p_id" value="${status.current.p_id }">
                                           <a href="#this" name="detail" id="product_name" title="${p.p_name }">${fn:substring(p.p_name,0,28) }</a>..</h4>
                                        </c:if>
                                        <c:if test="${fn:length(p.p_name) <29 }">
                                            <h4 class="title-price">
                                            <input type="hidden" id="p_id" value="${status.current.p_id }">
                                            <a href="#this" name="detail" id="product_name" title="${p.p_name }">${p.p_name }</a></h4>
                                        </c:if>
                                        <!-- end -->
                                        <!-- 신발 sex 구분 -->
                                           <c:if test="${p.p_sex == 0 }"> 
                                              <span class="gender text-uppercase">Unisex</span> 
                                           </c:if>
                                           <c:if test="${p.p_sex == 1 }"> 
                                              <span class="gender text-uppercase">MEN</span>
                                           </c:if>
                                           <c:if test="${p.p_sex == 2 }">
                                              <span class="gender text-uppercase">WOMEN</span>
                                           </c:if>
                                           <c:if test="${p.p_sex == 3 }">
                                              <span class="gender text-uppercase">Kids</span>
                                           </c:if>
                                        <!-- end -->
                                           <span class="gender">${p.p_category }</span>
                                       </div>    
                                       <div class="product-price">
                                           <span class="title-price" id="real_price">${p.p_price }</span>
                                           <!-- 정가 <span class="title-price line-through">$95.00</span> -->
                                       </div>
                                   </div>    
                                   <ul class="list-inline product-ratings">
                                   		<c:if test="${p.rate != 0 }">
                                   		<c:forEach begin="1" end="${p.rate}">
                                   			<li><i class="rating-selected fa fa-star"></i></li>
                                   		</c:forEach>
                                   		<c:forEach begin="1" end="${5 - p.rate}">
                                   			<li><i class="rating fa fa-star"></i></li>
                                   		</c:forEach>
                                   		</c:if>
                                   		<c:if test="${p.rate == 0 }">
	                                   		<li><i class="rating fa fa-star"></i></li>
	                                   		<li><i class="rating fa fa-star"></i></li>
	                                   		<li><i class="rating fa fa-star"></i></li>
	                                   		<li><i class="rating fa fa-star"></i></li>
	                                   		<li><i class="rating fa fa-star"></i></li>
                                   		</c:if>
                                       <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#this" name="addWish"><i class="fa fa-heart"></i></a></li>
                                   </ul>    
                               </div>
                           </div>
                         <c:if test="${i%j == j-1 }">
                         </div>
                         </c:if>
                         <c:set var="i" value="${i + 1 }" />
                       </c:forEach>
                   </c:when>
                   <c:otherwise>
                      <div>등록된 상품이 없습니다.</div>
                   </c:otherwise>
                </c:choose>
                </div><!--/end filter resilts-->

                <div class="text-center">
                    <ul class="pagination pagination-v2">
                        <li class="active"><a href="#this" onclick="funcPage('1')" id="1">1</a></li>
                        <c:if test="${list != null && fn:length(list) > 0 }">
                        	<c:if test="${fn:length(list) % 100 == 0}">
                        		<c:set value="${fn:length(list) / 100 }" var="pagesu"/>
                        		<fmt:formatNumber value="${pagesu}" pattern="0" var="realpagesu"/>
                        	</c:if>
                        	<c:if test="${fn:length(list) % 100 != 0}">
                        		<c:set value="${fn:length(list) / 100  + 1}" var="pagesu"/>
                        		<fmt:formatNumber value="${pagesu}" pattern="0" var="realpagesu"/>
                        	</c:if>
                        	<c:forEach var="i" begin="2" end="${realpagesu}">
                        		<li><a href="#this" onclick="funcPage('${i}')" id="${i}">${i}</a></li>
                        	</c:forEach>
                        </c:if>
                    </ul>                                                            
                </div><!--/end pagination-->
            </div>
        </div><!--/end row-->
    </div><!--/end container-->    
  </div><!--=== End Content Part ===-->
<%@ include file="/WEB-INF/include/include-footer-template.jspf" %>  <!-- /wrapper 보다 무조건 상단에 include-->  
</div><!--/wrapper-->

<!-- JS Implementing Plugins -->
<script src="assets/plugins/back-to-top.js"></script>
<script src="assets/plugins/smoothScroll.js"></script>
<script src="noUiSlider.9.0.0/nouislider.js"></script>
<script src="noUiSlider.9.0.0/nouislider.min.js"></script>
<script src="noUiSlider.9.0.0/wNumb.js"></script>
<script src="assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>

<!-- JS Page Level -->           
<script src="assets/js/shop.app.js"></script>
<!-- <script src="assets/js/plugins/mouse-wheel.js"></script> -->
<script>

	jQuery(document).ready(function() {
		if("${param.p_sex}" == "0, 1, 2, 3"){
			$(".filterBy").css("display","none");
			$(".panel-group").css("display","none");
		}
		var slider = document.getElementById('slider-snap');

		noUiSlider.create(slider, {
			start: [100000, 300000],
			tooltips: [wNumb({ decimals: 0 }), true ],
			connect: true,
			step: 10000,
			range: {
				'min': 0,
				'max': 500000
			},
			format: wNumb({
				decimals: 0,
			})
		});
		
		var nodes = [
		         	document.getElementById("slider-snap-value-lower"),
		         	document.getElementById("slider-snap-value-upper")
		         ];

		         slider.noUiSlider.on('update', function ( values, handle, unencoded, isTap, positions ) {
		         	nodes[handle].innerHTML = values[handle];
		         });
		         
		
		         slider.noUiSlider.on('change', function ( values, handle, unencoded, isTap, positions ) {
		 			
		 			var comSubmit = new ComSubmit();
		 			comSubmit.setUrl("<c:url value='/productlist.do' />");
		 		 	comSubmit.addParam("p_sex", "${param.p_sex}");
		 		 	comSubmit.addParam("p_sort", "${param.p_sort}");
		 		 	comSubmit.addParam("p_category", "${param.p_category}");
		 		 	comSubmit.addParam("p_name", "${param.p_name}");
		 		 	comSubmit.addParam("startPrice", $("span[id='slider-snap-value-lower']").text());
		 		 	comSubmit.addParam("endPrice", $("span[id='slider-snap-value-upper']").text());
		 		 	comSubmit.submit();
		          });
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~slider~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		if($("input[name='sort']").val() != ""){
			var sort = $("input[name='sort']").val();
			$("input:checkbox[id='" + sort + "']").prop("checked", true);
			
		}
		
		if($("input[name='category']").val() != ""){
			var category = $("input[name='category']").val();
			$("input:checkbox[id='" + category + "']").prop("checked", true);
		}

		if($("input[name='start']").val() != "" && $("input[name='end']").val() != ""){
			slider.noUiSlider.set( [$("input[name='start']").val(), $("input[name='end']").val()]);
		}
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~checkbox and slider value~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		
		App.init();
		App.initScrollBar();
		//MouseWheel.initMouseWheel();

		

		if("${param.pageNum}" != "" && "${param.pageNum}" != null){
			//alert("${param.pageNum / 100 + 1}");
			$("a[id='${param.pageNum}']").parent().parent().find($("li[class='active']")).removeClass("active")
			$("a[id='${param.pageNum}']").parent().addClass("active");
		}
		
	});

	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	function sortCheck(a){
		
		 var obj = $("input:checkbox[name='sort-checkbox']");
	     for(var i=0; i<obj.length; i++){
	         if(obj[i] != a){
	             obj[i].checked = false;
	         }
	     }
		
		//alert(a + " " + "${param.p_sex}");
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/productlist.do' />");
		comSubmit.addParam("p_sex", "${param.p_sex}");
		comSubmit.addParam("p_sort", a);
		comSubmit.submit();
	}
	
	function categoryCheck(categoryName){
		 var obj = $("input:checkbox[name='category-checkbox']");
	     for(var i=0; i<obj.length; i++){
	         if(obj[i] != categoryName){
	        	 obj[i].checked = false; 
	         }
	     }
	    var comSubmit = new ComSubmit();
	 	comSubmit.setUrl("<c:url value='/productlist.do' />");
	 	comSubmit.addParam("p_sex", "${param.p_sex}");
	 	comSubmit.addParam("p_sort", "${param.p_sort}");
	 	comSubmit.addParam("p_category", categoryName);
	 	comSubmit.submit();
	}
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	
	function funcPage(pagenum){
		//$("a[id='"+pagenum+"']").parent().parent().find($("li[class='active']")).removeClass("active");
		//$("a[id='"+pagenum+"']").parent().addClass("active");
		
		var comSubmit = new ComSubmit();
	 	comSubmit.setUrl("<c:url value='/productlist.do' />");
	 	comSubmit.addParam("p_sex", "${param.p_sex}");
	 	comSubmit.addParam("p_sort", "${param.p_sort}");
	 	comSubmit.addParam("p_category", "${param.p_category}");
	 	comSubmit.addParam("p_name", "${param.p_name}");
	 	comSubmit.addParam("pageNum", pagenum);
	 	comSubmit.submit();
		
	}
</script>


<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/js/plugins/placeholder-IE-fixes.js"></script>    
<![endif]-->
<!--[if lt IE 10]>
    <script src="assets/plugins/sky-forms-pro/skyforms/js/jquery.placeholder.min.js"></script>
<![endif]-->

</body>
</html> 
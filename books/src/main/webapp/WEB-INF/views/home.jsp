<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="kr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="/js/jquery/jquery.number.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#autocomplete").autocomplete({
			source : function(request, response) {

				$.ajax({
					url : "/autocomplete",
					type : "post",
					dataType : "json",
					data : request,
					
					success : function(data) {

						var result = data;
						response(result);
					},

					error : function(data) {
						alert("에러가 발생하였습니다.")
					}
				});
			}
		});
		
		$("#mainSearch").click(function(event) {
			event.preventDefault();
			// serialize는 form의 <input> 요소들의 name이 배열형태로 그 값이 인코딩되어 URL query string으로 하는 메서드
			let queryString = $(this).serialize();
			$.ajax({
				url : "/mainSearch",
				type: "post",
				dataType : "json",
				data : {
					item : $("#autocomplete").val()
				},
				async: false,
				success : function(data) {
					var sum = 0;
					$("#main").empty();
                    for (var i = 0; i < data.length; i++) {
                        //tr 태그를 생성해서 id에 tobody에 추가
                        var tr = $("<tr></tr>").appendTo("#main");
                        //tr에 td를 추가 후 내용을 데이터 값
                        $("<td style=\"text-align: left\"></td>").text(data[i]['place']).appendTo(tr);
                        $("<td style=\"text-align: left\"></td>").text(data[i]['placeDtl']).appendTo(tr);
                        $("<td style=\"text-align: left\"></td>").text(data[i]['service']).appendTo(tr);
                    }

				},
	
				error : function(data) {
					console.log("오류");
				}
			});
		});
	});
	
</script>
<style>
/* 매우 작은 기기들 (모바일폰, 768px 보다 작은) */
/* 부트스트랩에서 이것은 기본이므로 미디어쿼리가 없습니다. */

/* 작은 기기들 (태블릿, 768px 이상) */
@media ( min-width : @screen-sm-min) {
	...
}

/* 중간 기기들 (데스크탑, 992px 이상) */
@media ( min-width : @screen-md-min) {
	...
}

/* 큰 기기들 (큰 데스크탑, 1200px 이상) */
@media ( min-width : @screen-lg-min) {
	...
}
</style>
<title>베타 버전 - 마이홈 계산기</title>

</head>
<body>
	<div class="container" style="vertical-align: middle; margin-top: 2%; min-height: calc(100vh - 25px);">
		<div class="row">
			<div class="row">
				<div class="center-block">
					<div class="col-xs-2 col-md-2 col-sm-2"></div>
					<div class="col-xs-8 col-md-8 col-sm-8">
						<div class="alert alert-success" role="alert">
							베타버전입니다.<br />추가 예정: 숫자 표기 형식 변경 (ex.1,000), 시세 필드 수정 가능, 제작 개수
							입력
						</div>
						<h4>ITEM</h4>

						<div class="input-group" style="padding: 0px 0px 10px 0px;">
							<input id="autocomplete" type="text" class="form-control"
								placeholder="아이템을 입력하세요."> <span class="input-group-btn">
								<button class="btn btn-default" type="button" id="mainSearch"
									name="mainSearch">검색</button>
							</span>
						</div>
						<!-- /input-group -->
						<div id="autocomplete"></div>
						<div style="padding: 0px 0px 10px 0px;">
							<table class="table table-hover"table-layout:fixed" >
								<thead>
									<tr>
										<th>장소명</th>
										<th>장소명상세</th>
										<th>서비스제공사</th>
									</tr>
								</thead>
								<tbody id="main">

								</tbody>
							</table>
						</div>
					</div>
					<div class="col-xs-2 col-md-2 col-sm-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>

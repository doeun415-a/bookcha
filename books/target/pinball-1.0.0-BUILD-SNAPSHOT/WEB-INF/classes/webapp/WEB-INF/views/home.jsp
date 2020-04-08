<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="kr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />
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
	});
</script>

<title>베타 버전 - 마이홈 계산기</title>

</head>
<body>
	<div class="container" style="vertical-align: middle">
		<div class="row">
			<div class="row">
				<div class="center-block">
					<div class="col-xs-6 col-md-4 col-sm-4"></div>

						<div class="col-xs-6 col-md-4 col-sm-4">
							<div class="alert alert-success" role="alert">베타버전입니다.</div>
							<h4>ITEM</h4>
							<form class="form-inline">
								<div class="form-group">
									<input id="autocomplete" type="text" class="form-control" placeholder="아이템을 입력하세요.">
									<input class="btn btn-default" class="form-control" type="submit" value="검색" />
								</div>
							</form>
							<div id="autocomplete"></div>
						</div>

					<div class="col-xs-6 col-md-4 col-sm-4"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

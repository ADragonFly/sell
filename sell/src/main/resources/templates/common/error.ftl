<html>
<head>
    <meta charset="utf-8">
    <title>提示</title>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="alert alert-dismissable alert-warning">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4>
                    错误!
                </h4> <strong>${msg}</strong><a href="#" class="alert-link">3秒收自动跳转</a>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    setTimeout('location.href="${url}}"' , 3000);
</script>

</html>




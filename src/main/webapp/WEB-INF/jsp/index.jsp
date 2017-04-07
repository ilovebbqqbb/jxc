<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
    <link href="../jxc/js/layui/css/layui.css" rel="stylesheet">

    <style>
        body{
            width:100%;
            height:100%;
            margin:0;
            padding:0;
            background:url("../jxc/images/bg.jpg");
            background-size:100%;
        }
        
        .main {
            width: 600px;
            margin: 0 auto;
            margin-top: 150px;
            background-color: transparent;
           color:#fff;
        }

        .formbox {
            padding: 30px;
            padding-left: 0;
        }

            .formbox input {
                background-color: transparent;
            }
    </style>


<style>#haloword-pron { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -94px -34px; }#haloword-pron:hover { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -111px -34px; }#haloword-open { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -94px -17px; }#haloword-open:hover { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -111px -17px; }#haloword-close { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -94px 0; }#haloword-close:hover { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -111px 0; }#haloword-add { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -94px -51px; }#haloword-add:hover { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -111px -51px; }#haloword-remove { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -94px -68px; }#haloword-remove:hover { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -111px -68px; }</style><link id="layuicss-skinlayercss" rel="stylesheet" href="../jxc/js/layui/css/layui.css" media="all"></head>





<body>
    <div class="main" style="margin-top: 146px;">
        

        <fieldset class="layui-elem-field">
            <legend>登录</legend>
            <div class="formbox">
                <form class="layui-form">
                    <div class="layui-form-item">
                        <label class="layui-form-label">帐号</label>
                        <div class="layui-input-block">
                            <input type="text" name="username" required="" lay-verify="required" placeholder="帐号" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-inline">
                            <input type="password" name="pass" required="" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux"></div>
                    </div>





                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="reg">登录</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <a onclick="Reg()" style="cursor:pointer;">现在注册帐号</a>
                        </div>
                    </div>
                </form>

            </div>
        </fieldset>

        <script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
        <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
        <script>
            //Demo
            layui.use('form', function () {
                var form = layui.form();

                //监听提交
                form.on('submit(reg)', function (data) {
                    //layer.msg(JSON.stringify(data.field));
                    var loadIn = layer.load(1, {
                        shade: [0.1, '#fff'] //0.1透明度的白色背景
                    });

                    $.ajax({
                        type: "post",
                        url: "/home/login",
                        data: data.field,
                        datatype: "json",
                        success: function (msg) {
                            //alert(msg);
                            //alert(msg.code);

                            if (msg.code == "1") {
                                layer.msg("登录成功");
                                setTimeout(function () {
                                    location.href = msg.msg;

                                }, 1000);
                            }
                            else {
                                layer.close(loadIn);
                                layer.msg(msg.msg);
                            }

                        },
                        error: function () {
                            return false;
                        }


                    });



                    return false;
                });
            });
        </script>





        <script>
            function Reg() {


                layer.open({
                    type: 2,
                    title: "注册",
                    skin: 'layui-layer-rim', //加上边框
                    area: ['600px', '300px'], //宽高
                    content: "/home/reg"
                });


            }

            $(document).ready(function () {

                $(".main").css("margin-top", ($(window).height() - $(".main").height()) * 0.5 + "px");


            });

        </script>
    </div>
</body>
</html>
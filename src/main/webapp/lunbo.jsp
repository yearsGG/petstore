
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>        :root {
        --border-color: #999999;
        --bg-color: #fffbd6;
        --button-size: 25px;
        --button-gap: 1em;
    }

    #max {
        width: 1000px;
        height: 500px;
        align-items: center;
        margin: 5% auto;
        margin-top: 0%;
    }

    .re {
        position: relative;
        height: 400px;
    }

    .re ul {
        list-style-type: none;
    }

    .re ul > li {
        width: 700px;
        height: 300px;
        position: absolute;
        transition: 1s;
        opacity: 0;
    }

    .re ul > li img {
        width: 900px;
        height: 500px;
        border-radius: 10%;
        border: 15px solid var(--bg-color);
    }

    #max ol {
        position: relative;
        display: grid;
        grid-template-columns: repeat(5, 60px);
        grid-template-rows: auto;
        grid-gap: var(--button-gap);
        float: right;
        margin-top: 400px;
        list-style: none;
    }

    #max ol li {
        width: var(--button-size);
        height: var(--button-size);
        font-size: 15px;
        line-height: 20px;
        float: left;
        text-align: center;
        border-radius: 2em;
        border: 5px solid var(--yellow);
    }
    </style>



</head>
<body>

<div id="max">
    <div class="re">
        <ul>
            <li><img src="./biaotou/biaotou1.png" alt=""></li>
            <li><img src="./biaotou/biaotou2.png" alt=""></li>
            <li><img src="./biaotou/biaotou3.png" alt=""></li>
            <li><img src="./biaotou/biaotou4.png" alt=""></li>
            <li><img src="./biaotou/biaotou5.png" alt=""></li>
        </ul>
        <ol>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ol>
    </div>
</div>

<script>
    window.onload = function(){
        var box=this.document.getElementsByClassName("re")[0];
        var lik=box.getElementsByTagName("li");
        function fun(i,j){//转换图片函数，就是把透明度改了一下
            lik[i].style.opacity=1;
            lik[j].style.opacity=0;
            lik[i+5].style.backgroundColor="#ffffff";//改一下小图标
            lik[j+5].style.backgroundColor="#00000000"
        }
        fun(0,1);//初始化下
        var i =0;
        function auto(){//轮播循环函数
            if(++i>=5){
                i=0;
                fun(0,4);
            }
            else fun(i,i-1);
        }
        timer=this.setInterval(auto,2000);
        box.onmouseover = function () { //鼠标划上去，停止轮播
            console.log('good');
            clearInterval(timer);
        }
        box.onmouseout = function () { //鼠标划出，继续轮播
            timer = setInterval(auto, 2000); //调用定时器
        }
        var j =0;
        for(;j<5;j++){//点击小图标也可以转换图片
            lik[j+5].ind=j;
            lik[j+5].onclick=function(){
                fun(this.ind,i)
                i=this.ind;
            }
        }

    }
</script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<footer class="footer mt-1 py-3">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md">
                <img src="img/favicon.png" width="24" height="24" class="mb-2">
                <small class="d-block mb-3 text-muted">© 2024</small>
            </div>
            <div class="col-6 col-md">
                <h5>备案信息</h5>
                <ul class="list-unstyled text-small">
                    <li><a class="text-muted" href="#">备案号:1314520</a></li>
                </ul>
            </div>
            <div class="col-6 col-md">
                <h5>工商信息</h5>
                <ul class="list-unstyled text-small">
                    <li><a class="text-muted" href="#">商业资质</a></li>
                </ul>
            </div>
            <div class="col-6 col-md">
                <h5>关于我们</h5>
                <ul class="list-unstyled text-small">
                    <li><a class="text-muted" href="#">吉利游戏商城有限公司</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>
</div>

<div style="position: fixed;top: 0;left:0;bottom: 0;right: 0;z-index: 0">
    <canvas id="canvas" style="background-color:rgb(246,248,248);"></canvas>
</div>
<script type="text/javascript">
    const canvas = document.getElementById('canvas')
    const ctx = canvas.getContext('2d')
    let width = window.innerWidth
    let height = window.innerHeight

    let dotsNum = 50 // 点的数量
    let radius = 1 // 圆的半径，连接线宽度的一半
    let fillStyle = 'rgb(168,216,227)' // 点的颜色
    let lineWidth = radius * 2
    let connection = 100 // 连线最大距离
    let followLength = 60 // 鼠标跟随距离

    let dots = []
    let animationFrame = null
    let mouseX = null
    let mouseY = null

    function addCanvasSize () { // 改变画布尺寸
        width = window.innerWidth
        height = window.innerHeight
        canvas.width = width
        canvas.height = height
        ctx.clearRect(0, 0, width, height)
        dots = []
        if (animationFrame) window.cancelAnimationFrame(animationFrame)
        initDots(dotsNum)
        moveDots()
    }

    function mouseMove (e) {
        mouseX = e.clientX
        mouseY = e.clientY
    }

    function mouseOut (e) {
        mouseX = null
        mouseY = null
    }

    function mouseClick () {
        for (const dot of dots) dot.elastic()
    }

    class Dot {
        constructor(x, y) {
            this.x = x
            this.y = y
            this.speedX = Math.random() * 2 - 1
            this.speedY = Math.random() * 2 - 1
            this.follow = false
        }
        draw () {
            ctx.beginPath()
            ctx.arc(this.x, this.y, radius, 0, 2 * Math.PI)
            ctx.fill()
            ctx.closePath()
        }
        move () {
            if (this.x >= width || this.x <= 0) this.speedX = -this.speedX
            if (this.y >= height || this.y <= 0) this.speedY = -this.speedY
            this.x += this.speedX
            this.y += this.speedY
            if (this.speedX >= 1) this.speedX--
            if (this.speedX <= -1) this.speedX++
            if (this.speedY >= 1) this.speedY--
            if (this.speedY <= -1) this.speedY++
            this.correct()
            this.connectMouse()
            this.draw()
        }
        correct () { // 根据鼠标的位置修正
            if (!mouseX || !mouseY) return
            let lengthX = mouseX - this.x
            let lengthY = mouseY - this.y
            const distance = Math.sqrt(lengthX ** 2 + lengthY ** 2)
            if (distance <= followLength) this.follow = true
            else if (this.follow === true && distance > followLength && distance <= followLength + 8) {
                let proportion = followLength / distance
                lengthX *= proportion
                lengthY *= proportion
                this.x = mouseX - lengthX
                this.y = mouseY - lengthY
            } else this.follow = false
        }
        connectMouse () { // 点与鼠标连线
            if (mouseX && mouseY) {
                let lengthX = mouseX - this.x
                let lengthY = mouseY - this.y
                const distance = Math.sqrt(lengthX ** 2 + lengthY ** 2)
                if (distance <= connection) {
                    opacity = (1 - distance / connection) * 0.5
                    ctx.strokeStyle = `rgba(255,255,255,${opacity})`
                    ctx.beginPath()
                    ctx.moveTo(this.x, this.y)
                    ctx.lineTo(mouseX, mouseY);
                    ctx.stroke();
                    ctx.closePath()
                }
            }
        }
        elastic () { // 鼠标点击后的弹射
            let lengthX = mouseX - this.x
            let lengthY = mouseY - this.y
            const distance = Math.sqrt(lengthX ** 2 + lengthY ** 2)
            if (distance >= connection) return
            const rate = 1 - distance / connection // 距离越小此值约接近1
            this.speedX = 40 * rate * -lengthX / distance
            this.speedY = 40 * rate * -lengthY / distance
        }
    }

    function initDots (num) { // 初始化粒子
        ctx.fillStyle = fillStyle
        ctx.lineWidth = lineWidth
        for (let i = 0; i < num; i++) {
            const x = Math.floor(Math.random() * width)
            const y = Math.floor(Math.random() * height)
            const dot = new Dot(x, y)
            dot.draw()
            dots.push(dot)
        }
    }

    function moveDots () { // 移动并建立点与点之间的连接线
        ctx.clearRect(0, 0, width, height)
        for (const dot of dots) {
            dot.move()
        }
        for (let i = 0; i < dots.length; i++) {
            for (let j = i; j < dots.length; j++) {
                const distance = Math.sqrt((dots[i].x - dots[j].x) ** 2 + (dots[i].y - dots[j].y) ** 2)
                if (distance <= connection) {
                    opacity = (1 - distance / connection) * 0.5
                    ctx.strokeStyle = `rgba(255,255,255,${opacity})`
                    ctx.beginPath()
                    ctx.moveTo(dots[i].x, dots[i].y)
                    ctx.lineTo(dots[j].x, dots[j].y);
                    ctx.stroke();
                    ctx.closePath()
                }
            }
        }
        animationFrame = window.requestAnimationFrame(moveDots)
    }

    addCanvasSize()

    initDots(dotsNum)
    moveDots()

    document.onmousemove = mouseMove
    document.onmouseout = mouseOut
    document.onclick = mouseClick
    window.onresize = addCanvasSize
</script>
</body>
</html>
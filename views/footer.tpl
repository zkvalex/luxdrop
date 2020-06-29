<div class="stats">

<div class="container">

    <div class="vk-group">
        <script type="text/javascript" src="//vk.com/js/api/openapi.js?145"></script>
    
        <div id="vk_groups" style="margin-top: 7px;"></div>
        <script type="text/javascript">
            VK.Widgets.Group("vk_groups", {
                mode: 3,
                width: "305"
            }, 145470431);
        </script>
    </div>

    <div class="cols">

        <div class="col">
            <h4><?=number_format($getStats['users'],0,'',' ');?></h4>
            <h5>Всего пользователей</h5>
        </div>

        <div class="col">
            <h4><?=$getStats['online'];?></h4>
            <h5>Пользователей онлайн</h5>
        </div>

        <div class="col">
            <h4><?=$getStats['knives'];?></h4>
            <h5>Ножей за сегодня</h5>
        </div>

        <div class="col">
            <h4><?=number_format($getStats['opened'],0,'',' ');?></h4>
            <h5>Открыто кейсов</h5>
        </div>

    </div>

    <div class="clearfix"></div>

</div>

</div>

<div class="payments">

<h1>Любые способы оплаты</h1>

</div>

<div class="footer">

<div class="container">

    <div class="copyright">© 2015-2017 LuxDrop</div>

    <ul>
        <li><a href="/">Главная</a></li>
        <li><a href="#" onclick="modal_open( 'modal-coupon' ); return false;">Промокод</a></li>
        <li><a href="/faq.html">FAQ</a></li>
        <li><a href="/support.html">Поддержка</a></li>
        <li><a href="/rules.html">Пользовательское соглашение</a></li>
    </ul>

    <div class="links">
        <a href="https://vk.com/luxdrop" rel="nofollow" class="link-vk" target="_blank">
            <span></span>
            Мы в ВК
        </a>
    </div>

</div>

<div class="clearfix"></div>

</div>
<?php 

// $name = trim($_GET['name']);
// var_dump($name);
// die();
?>


<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="content-language" content="ru" />
    <meta name="viewport" content="width=1200">
    <link rel="shortcut icon" href="/favicon.ico" />
    <meta property="vk:title" content="Открывай бесплатный кейс CS:GO каждые два часа на LuxDrop.ru!" />
    <meta property="vk:description"
        content="Не упусти свой шанс! Заходи на LuxDrop.ruи участвуй СОВЕРШЕННО БЕСПЛАТНО!" />
    <meta property="vk:text" content="Не упусти свой шанс! Заходи на LuxDrop.ruи участвуй СОВЕРШЕННО БЕСПЛАТНО!" />
    <meta property="vk:url" content="https://luxdrop.ru/case/free/">
    <meta property="vk:image" content="https://luxdrop.ru/templates/Default/images/vk_poster.jpg" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Открывай бесплатный кейс CS:GO каждые два часа на LuxDrop.ru!" />
    <meta property="og:description"
        content="Не упусти свой шанс! Заходи на LuxDrop.ruи участвуй СОВЕРШЕННО БЕСПЛАТНО!" />
    <meta property="og:site_name" content="LuxDrop.ru" />
    <meta property="og:url" content="https://luxdrop.ru/case/free/" />
    <meta property="og:image" content="https://luxdrop.ru/templates/Default/images/vk_poster.jpg" />
    <link media="screen" href="/templates/Default/css/main.min.css?v=36" type="text/css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <link media="screen" href="/templates/Default/js/flipclock/flipclock.css" type="text/css" rel="stylesheet" />
    <script src="/templates/Default/js/flipclock/flipclock.min.js" type="text/javascript"></script>
    <script src="/templates/Default/js/fontawesome.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" type="text/javascript"></script>
    <script src="/templates/Default/js/jssor.slider-23.1.1.mini.js" type="text/javascript"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Открыть кейс Засекреченное КС ГО - Открывайте лучшие бесплатные кейсы CS GO с симулятором на LuxDrop.ru
    </title>
    <meta name="description"
        content="Открыть кейс Засекреченное в игре КС ГО бесплатно. Кейс Засекреченное CS GO с реальными вещами и получайте бонусы в виде 1 кейса в подарок на нашем сайте" />
    <meta name="keywords"
        content="кс го, кейс, cs go, засекреченное, засекреченное, подарок, нашем, luxdrop, кейса, сайте, получайте, бесплатно, реальными, вещами, открыть, бонусы" />
</head>

<body>
    <script type="text/javascript">
        var user_url = '';
    </script><!-- Модальное окно реального выигрыша -->
    <div class="modal modal-payment" id="modal-payment">
        <div class="big-title">Пополнение баланса</div>
        <div id="headers">
            <h2 id="weapon_name"> 0 <i class="fa fa-rub"></i></h2>
            <h3>Ваш текущий баланс</h3>
        </div>
        <div class="alert-red" id="not-enought-money" style="display: none;"> У вас недостаточно денег на балансе для
            открытия кейса <h3>Введите сумму для пополнения:</h3>
        </div>
        <form method="post" action="" onsubmit="unitpay(); return false;">
            <div class="sum"><button type="button" class="btn btn-red" onclick="change_sum( '-' );"><span
                        class="icon"></span></button><input type="text" name="sum" value="Введите сумму пополнения"
                    class="sum" id="sum"
                    onfocus="if( this.value == 'Введите сумму пополнения') this.value = ''; else if( this.value == '' ) this.value='0'; $(this).addClass('focused');"
                    onblur="if( this.value == '' ) { this.value='Введите сумму пополнения'; $(this).removeClass('focused'); }"
                    maxlength="6" /><button type="button" class="btn btn-red" onclick="change_sum( '+' );"><span
                        class="icon"></span></button></div><input type="hidden" name="action" value="init" />
            <div class="actions"><button type="submit" disabled="disabled" class="btn btn-red"><i class="fa fa-rub"></i>
                    Пополнить</button><button type="button" onclick="skinpay(); return false;" class="btn btn-red"><span
                        class="icon-skinpay"></span> Скинами</button>
                <div class="clearfix"></div>
            </div>
        </form>
        <div class="bonuses">
            <h4>Бонусы при пополнении баланса</h4>
            <div class="bonus">
                <h5>> 250 <i class="fa fa-rub"></i></h5><span>5%</span> от суммы пополнения
            </div>
            <div class="bonus">
                <h5>> 500 <i class="fa fa-rub"></i></h5><span>10%</span> от суммы пополнения
            </div>
            <div class="bonus">
                <h5>> 1 000 <i class="fa fa-rub"></i></h5><span>20%</span> от суммы пополнения
            </div>
            <div class="clearfix"></div>
            <div class="text">Бонус зачисляется на Ваш баланс<br /> сразу же после пополнения</div>
        </div>
    </div><!-- Модальное окно реального выигрыша -->
    <div class="modal modal-coupon" id="modal-coupon">
        <div class="big-title">Активация промокода</div><input type="text" name="coupon" value=""
            placeholder="Введите промокод" maxlength="15" />
        <div class="actions"><button type="submit" class="btn btn-red"
                onclick="coupon_activate();">Активировать</button>
            <div class="clearfix"></div>
        </div>
        <div class="text" id="text-error"></div>
        <div class="text text-success" id="text-success"></div>
        <h3>После активации промокода &mdash; деньги начисляются на баланс мгновенно</h3>
    </div>
    <div class="wrapper"><a href="#" class="modal-close"></a>
        <div class="modal-bg"></div>
                <!-- Header -->
		<?php include 'header.tpl'; ?>
        <div id="slider">
            <div data-u="slides" id="slider-slides">
                <div>
                    <div class="slider" onclick="window.open('https://vk.com/wall-145470431_16', '_blank');">
                        <div class="container">
                            <h1 class="darimbabki">Дарим деньги при<br>пополнении баланса</h1>
                            <div class="text">Пополняй баланс на сумму от 250 руб<br>и получай в подарок до 10 000 руб
                            </div>
                            <a href="#" class="button">Подробнее об акции</a>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="slider slider-2" onclick="window.open('https://vk.com/wall-145470431_17', '_blank');">
                        <div class="container">
                            <h1>Кейс в подарок</h1>
                            <div class="text">Открой 5 любых одинаковых кейсов —<br>получи 6-й абсолютно
                                бесплатно</div>
                            <a href="#" class="button">Подробнее об акции</a>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="slider slider-3" onclick="window.open('https://vk.com/wall-145470431_18', '_blank');">
                        <div class="container">
                            <h1>Дарим 20 <i class="fa fa-rub"></i> на счет!</h1>
                            <div class="text">Просто зарегистрируйся на сайте и<br>вступи в нашу группу ВК. Деньги
                                твои!</div>
                            <a href="#" class="button">Подробнее об акции</a>
                        </div>
                    </div>
                </div>

            </div>
            <!-- Arrow Navigator -->
            <!-- <span data-u="arrowleft" class="jssora22l" data-autocenter="2"></span>
			<span data-u="arrowright" class="jssora22r" data-autocenter="2"></span> -->
        </div>
        <div class="live-drops">
            <h3>Live-дропы</h3>
            <ul id="live-drops">
                <li class="item-milspec" data-live-drop-id="210137"><a href="/user/76561198291563843/"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpoor-mcjhoyszecC9L7927m7-HnvD8J_WJlzMHu5Yo2urFpYr22gDnqEBqam6gJ9KQdwc_YlGE-VS7wri70Ja_ot2Xnk_reDFK/206x154"
                            height="75" /></a><span class="live-drop-item"><span class="str"></span><span
                            class="item-name">Tec-9 | Смешанный камуфляж</span><em>3.00 <i
                                class="fa fa-rub"></i></em><img src="/uploads/cases/case_56.png" height="60" /><span
                            class="user-nick"><i class="fa fa-user"></i> COSTROMA</span></span></li>
                <li class="item-milspec" data-live-drop-id="210136"><a href="/user/76561198291563843/"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpouLWzKjhz3MzadDl94dmynZWG2aega-7TkjtQuMMgj7iR9NugiQft-RJtNm-ndoCRIwVvM1jSrwK9kO_xxcjr6R38t40/206x154"
                            height="75" /></a><span class="live-drop-item"><span class="str"></span><span
                            class="item-name">Nova | Карамельное яблоко</span><em>3.90 <i
                                class="fa fa-rub"></i></em><img src="/uploads/cases/case_59.png" height="60" /><span
                            class="user-nick"><i class="fa fa-user"></i> COSTROMA</span></span></li>
                <li class="item-milspec" data-live-drop-id="210135"><a href="/user/76561198254141045/"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpoor-mcjhoyszecC9L7927m7-HnvD8J_WJlzMHu5Yo2urFpYr22gDnqEBqam6gJ9KQdwc_YlGE-VS7wri70Ja_ot2Xnk_reDFK/206x154"
                            height="75" /></a><span class="live-drop-item"><span class="str"></span><span
                            class="item-name">Tec-9 | Смешанный камуфляж</span><em>3.00 <i
                                class="fa fa-rub"></i></em><img src="/uploads/cases/case_56.png" height="60" /><span
                            class="user-nick"><i class="fa fa-user"></i> Петрович</span></span></li>
                <li class="item-uncommon" data-live-drop-id="210134"><a href="/user/76561198353331340/"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopb3wflFf0uL3dTxP7c-1gZO0hPChZujummJW4NE_372Sptmg3gzjrUNvam-icIeVJ1I8N1rX-lTskuzrh8XpucudnyAwvz5iuygR9uL9aQ/206x154"
                            height="75" /></a><span class="live-drop-item"><span class="str"></span><span
                            class="item-name">SG 553 | Дамасская сталь</span><em>4.74 <i class="fa fa-rub"></i></em><img
                            src="/uploads/cases/case_56.png" height="60" /><span class="user-nick"><i
                                class="fa fa-user"></i> ШаТун</span></span></li>
                <li class="item-uncommon" data-live-drop-id="210133"><a href="/user/76561198035958015/"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou7uifDhoyszPdDJP6ciknYO0hOPxI6jukXlU7ctOguzA45W72Q3k_hdpYm-iIYSddQc-YVyD-lK7l-3v1p-56MiYz3RquCV2sHvfzQv330-hLT2elw/206x154"
                            height="75" /></a><span class="live-drop-item"><span class="str"></span><span
                            class="item-name">MAG-7 | Антитерраса</span><em>163.67 <i class="fa fa-rub"></i></em><img
                            src="/uploads/cases/case_66.png" height="60" /><span class="user-nick"><i
                                class="fa fa-user"></i> Anton.St</span></span></li>
                <li class="item-none" data-live-drop-id="210132"><a href="/user/76561198254141045/"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpouLWzKjhz3MzbcDNG09C_k4if2aSna-6FwzsJu5Ypj-uVrdyk2wzkqEQ4ZD3wJo7DcAQ2ZAmE-QC5xejxxcjrmUdg9dQ/206x154"
                            height="75" /></a><span class="live-drop-item"><span class="str"></span><span
                            class="item-name">Nova | Песчаные дюны</span><em>4.20 <i class="fa fa-rub"></i></em><img
                            src="/uploads/cases/case_59.png" height="60" /><span class="user-nick"><i
                                class="fa fa-user"></i> Петрович</span></span></li>
                <li class="item-rare" data-live-drop-id="210131"><a href="/user/76561198251251576/"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpovbSsLQJf1ObcTjxT0966gYWPqPv9NLPF2DtUvJVziLnEpon33VCx-Bc5Yjv6JoOddwVrYg3UrwK5xOu5jMS6uczXiSw0dJL_lKg/206x154"
                            height="75" /></a><span class="live-drop-item"><span class="str"></span><span
                            class="item-name">★ Нож с лезвием-крюком | Вороненая сталь</span><em>2 555.10 <i
                                class="fa fa-rub"></i></em><img src="/uploads/cases/case_5.png" height="60" /><span
                            class="user-nick"><i class="fa fa-user"></i> NoF3x emerald.gg</span></span></li>
                <li class="item-restricted" data-live-drop-id="210130"><a href="/user/76561198302212427/"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpos7asPwJfwPz3ZTxM69mknY6OqP_xMq3I2DkG65Vy0rqQ9Imi2A3kqhE5ZG36doPGclQ8M1_V_wLql-q-gZe7uMvXiSw0fugahP8/206x154"
                            height="75" /></a><span class="live-drop-item"><span class="str"></span><span
                            class="item-name">Dual Berettas | Подрыв</span><em>53.77 <i class="fa fa-rub"></i></em><img
                            src="/uploads/cases/case_69.png" height="60" /><span class="user-nick"><i
                                class="fa fa-user"></i> Muffin✞</span></span></li>
                <li class="item-none" data-live-drop-id="210129"><a href="/user/76561198254141045/"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot6-iFBRv7OPFcgJO5du-gM6OxfakZbnQw28H65Eg2L2RrYin3ADjrkJqYWz0Jo6UdVNrYV3SqAW9366x0l1OAhlP/206x154"
                            height="75" /></a><span class="live-drop-item"><span class="str"></span><span
                            class="item-name">AUG | Наемник</span><em>5.00 <i class="fa fa-rub"></i></em><img
                            src="/uploads/cases/case_59.png" height="60" /><span class="user-nick"><i
                                class="fa fa-user"></i> Петрович</span></span></li>
                <li class="item-none" data-live-drop-id="210128"><a href="/user/76561198254141045/"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot6-iFBRv7OPFcgJO5du-gM6OxfakZbnQw28H65Eg2L2RrYin3ADjrkJqYWz0Jo6UdVNrYV3SqAW9366x0l1OAhlP/206x154"
                            height="75" /></a><span class="live-drop-item"><span class="str"></span><span
                            class="item-name">AUG | Наемник</span><em>5.00 <i class="fa fa-rub"></i></em><img
                            src="/uploads/cases/case_59.png" height="60" /><span class="user-nick"><i
                                class="fa fa-user"></i> Петрович</span></span></li>
                <li class="item-classified" data-live-drop-id="210127"><a href="/user/76561198194175419/"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgposr-kLAtl7PLZTjlH_9mkgIWKkPvxDLDEm2JS4Mp1mOjG-oLKhF2zowcDPzixc9OLcw82ZlyF8wC8wb251MW4tcifmydi7CEn4HiPlhyy1BxJbeNshqPIHELeWfJvK5CfiA/206x154"
                            height="75" /></a><span class="live-drop-item"><span class="str"></span><span
                            class="item-name">Desert Eagle | Дракон-предводитель</span><em>123.94 <i
                                class="fa fa-rub"></i></em><img src="/uploads/cases/case_29.png" height="60" /><span
                            class="user-nick"><i class="fa fa-user"></i> DistolT</span></span></li>
                <li class="item-uncommon" data-live-drop-id="210126"><a href="/user/76561198254141045/"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou7umeldf0uL3fDxB043mq4GHnvL6DLjQm2Ru5cB1g_zMu9-hjAfk8kJpMW3zdYOSJgE6YVCErwC5kry-hZK5u8vNyXpjuici4n_D30vgGysqe2g/206x154"
                            height="75" /></a><span class="live-drop-item"><span class="str"></span><span
                            class="item-name">MAC-10 | Плотоядный</span><em>11.60 <i class="fa fa-rub"></i></em><img
                            src="/uploads/cases/case_1.png" height="60" /><span class="user-nick"><i
                                class="fa fa-user"></i> Петрович</span></span></li>
                <li class="item-uncommon" data-live-drop-id="210125"><a href="/user/76561198254141045/"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpotLO_JAlf1OD3YS197tWsm460n_bmJb7Cgm5D18h0juDU-MLzjFe1_kJvZminco_GdFNtaQ2GrAO3lLu51p64upXJyyNk6SUk436OgVXp1q-ikIml/206x154"
                            height="75" /></a><span class="live-drop-item"><span class="str"></span><span
                            class="item-name">ПП-19 Бизон | Жнец</span><em>9.70 <i class="fa fa-rub"></i></em><img
                            src="/uploads/cases/case_1.png" height="60" /><span class="user-nick"><i
                                class="fa fa-user"></i> Петрович</span></span></li>
                <li class="item-none" data-live-drop-id="210124"><a href="/user/76561198532463921/"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgposem2LFZfwOP3ZTxS6eOlnI-Zg8j-JrXWmm5u5Mx2gv2Ppd7zjATirxFkNWD2JIGde1Q4MlyCrAe8x-u705a6uJ7Aynph6SUq4GGdwUKYnSlmwg/206x154"
                            height="75" /></a><span class="live-drop-item"><span class="str"></span><span
                            class="item-name">G3SG1 | Тропическая штриховка</span><em>4.70 <i
                                class="fa fa-rub"></i></em><img src="/uploads/cases/case_60.png" height="60" /><span
                            class="user-nick"><i class="fa fa-user"></i> Dovahkiin</span></span></li>
            </ul>
        </div>
        <!-- Модальное окно реального выигрыша -->
        <div class="modal-win-under"></div>
        <div class="modal modal-win" id="modal-win-trial">
            <div class="big-title">Вы могли бы выиграть</div>
            <h2 id="weapon_name">Нож-бабочка Африканская сетка</h2>
            <h3><span id="weapon_price">3 000</span><i class="fa fa-rub"></i></h3><img
                src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpovbSsLQJf0ebcZThQ6tCvq5ObqPrxILPugmpf18l4jeHVyoD0mlOx5Uo_YGmmd9OQIFNsYlDT_1foxe7p0JPvucuYzHQ2vXYm5XrbyRWwhB9SLrs41jxCA9c/480x360"
                id="weapon_image" alt="#" />
            <div class="actions"><button type="button" class="btn btn-red" id="open_case"
                    onclick="open_case( 'zasekrechennoe' ); return false;">Открыть за <span id="case_price"></span><i
                        class="fa fa-rub"></i></button><button type="button" class="btn btn-red" id="open_case_trial"
                    onclick="open_case_trial( 'zasekrechennoe' ); return false;">Попробовать еще</button>
                <div class="clearfix"></div>
            </div>
        </div><!-- Модальное окно реального выигрыша -->
        <div class="modal-win-under"></div>
        <div class="modal modal-win" id="modal-win" data-last-timer-id="">
            <div class="big-title">Поздравляем</div>
            <h2 id="weapon_name"></h2><img src="" id="weapon_image" alt="#" />
            <div class="actions"><button type="button" class="btn btn-red" id="item_send" data-item-send=""><i
                        class="fa fa-clock-o"></i><span class="timer">59:59</span> Забрать</button><button type="button"
                    class="btn btn-red" id="item_sell" data-item-sell=""><i class="fa fa-shopping-cart"></i> Продать за
                    <span id="weapon_price"></span><i class="fa fa-rub"></i></button><button type="button"
                    disabled="disabled" class="btn btn-red btn-100" id="item_sended">Предмет отправлен в
                    Steam</button><button type="button" disabled="disabled" class="btn btn-red btn-100"
                    id="item_sold">Продано за <span id="weapon_price"></span><i class="fa fa-rub"></i></button>
                <div class="clearfix"></div>
            </div>
            <div class="text"> Заберите предмет в течение часа или на ваш баланс вернется его полная стоимость </div>
        </div>
        <div class="page-case">
            <div class="item-info" id="case-info">
                <div class="container">
                    <h1>Открыть кейс Засекреченное</h1>
                    <div class="mini-title">249 <i class="fa fa-rub"></i></div>
                    <h2><a href="/" title="Открыть другие кейсы кс го">Другие кейсы КС ГО</a></h2>
                    <div class="items-carousel-wrap" id="items-random">
                        <div class="arrow"></div>
                        <div class="items-carousel" id="items-carousel">
                            <ul class="items"></ul>
                        </div>
                    </div>
                    <div class="item-main" id="item-description"><img src="/uploads/cases/case_3.png"
                            alt="Кейс Засекреченное" title="Кейс Засекреченное" /></div><button type="button"
                        class="btn btn-green" id="button_open_case_free" style="display: none;"
                        onclick="open_case( 'zasekrechennoe' ); return false;"> Открыть бесплатно </button><button
                        type="button" class="btn btn-red" id="button_open_case"
                        onclick="window.location = 'https://luxdrop.ru/steam/?login';"> Открыть кейс </button>
                    <div class="case-free-text" id="case_free_text" style="display: none;">Поздравляем! Вы открыли 5
                        одинаковых кейсов и теперь можете открыть его совершенно бесплатно!</div>
                </div>
            </div>
            <h3>Содержимое кейса</h3>
            <div class="items" id="items-list">
                <div class="container">
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="261"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz52YOLkDyRufgHMAqVMY_YvywW4CHZ_-_hmWNKx9rUSFlG64NuDbq4qN4seF8jZWvXSYgqru0g-hKlfJpKNp3npiym6aDtZUxa_rmIMmeXWpPI11YiABWgk/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>M4A1-S</h3>
                            <h4>Страж</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="262"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz56P7fiDzZ2TQXJVfdhX_Qo4A3gNio37M52WZmz9e0ALAjttYKVN7QvZtxEG8nXCPXSYwD970huiKgLK8Daoim-ji7oJC5UDGS-VkfD/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AK-47</h3>
                            <h4>Картель</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="263"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot7HxfDhh3szKcDBA49OJnpWFkPvxDLfYkWNFppwpie2Rp9_w0VDm-UNrMj30IoPHdAY-M1rY-1K7w7291pO8vJTJzHN9-n51xLwwH8g/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AK-47</h3>
                            <h4>Гидропоника</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="264"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot7HxfDhjxszfdDFO08iklZaOm_LwDLrawjxu5Mx2gv2PotytiQHnqhBoZGqnI9XBcgQ-Yl_Y_Vfvyey9g8S4753JzSA1s3Eh5GGdwUIoc5a5cw/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AK-47</h3>
                            <h4>Путешественник</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="265"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz56P7fiDz9-TQXJVfdSXfgF-Q3oADI_ppdnDdK18e4CLQ_v5YeQMuYkMtEdHpLYWP7XMw6v60xpiKhfJpWBpCrxnXO-X5QNkco/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AK-47</h3>
                            <h4>Красный глянец</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="266"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz56P7fiDzRyTQXJVfdhX_o45gnTBCI24dJuGtay8-MEew_n4YCTNOMuNNhLF8GDU6KDNFipvEg-gfRfLp2PpXi82Hz3ejBdOj7r2Ww/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AK-47</h3>
                            <h4>Красная линия</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="267"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz56IeSKOC5YZg3FBLJhUfA-_R3hR3JisMMwVoXvpeNWKl-6tYvAYOQoMNwdSZbYDvCEb1-pu0850qVcep2X4HS4l-v7zTM/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AUG</h3>
                            <h4>Бенгальский тигр</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="268"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz56I_OKOC5YcAjDDJ9NVfgq-A3TBCI24dJuGoPlo-JUeQS84NGSMuQvOdBISpKBU6TUMwqruxo50fdcfcaAqHnpj3z3ejBdzQVSDJ4/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AWP</h3>
                            <h4>БАХ</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="269"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz56I_OKMyJYdAXUBKxfY_Qt5DfhDCM7_cotA4Lhr7lSLQ_tt4GVYrl4MY1IGJOGX_fTYF-p6E1u0qJVL5GB8S-9jDOpZDknDIyvzQ/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AWP</h3>
                            <h4>Кортисейра</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="270"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz56I_OKOC5Yeg3UBJ9TWfEz4QWiUXJl6cY2UNLl9e4HcVm-tobFOuIvMNBPF8TRDv6DZ1v84ks91aJae4vJ_n0-dvDrog/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AWP</h3>
                            <h4>Электрический улей</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="271"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz56I_OKMTpYcRbXDLBSWco45gn6Bhg-4cBrQJnj8e5fLVnttoWSMbgsZtsfHJLTU6DXMw6o7kJp06BZLJaKqHm-2H_rJC5UDIW53w6s/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AWP</h3>
                            <h4>Графит</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="272"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz56I_OKMyJYcxPSPqNRXuc7ywXpDS4n5Yk1DIHv9OxRKg7psNeUNbQrNI5ETsjQC6OEZFqru0o61fBbJpDfqC7pw223bdl877LM/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AWP</h3>
                            <h4>Красная линия</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="273"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz54LrTgMQhmfzvEFLNdVPw7ywXpDS4n5YlhUICw9uJee1rr54TAMLd6YtBLG8bVX_CEZlz46B09gqdaJ5TcoSrpw223bRV4bK-f/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>CZ75-Auto</h3>
                            <h4>Новая фуксия</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="274"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz54LrTgMQhkZzvBG_cLXco5_An_HS4o7dVcWdKy_q4LZw69vdTBYLAkZopJHJSDCPGGZw2puxk9ifIJLJbfpSO61Hm_PTtfChb1ujVTRKDBiB4/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>CZ75-Auto</h3>
                            <h4>Желтый жакет</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="275"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5_MeKyPDJYcwn9BaROXeE-8Qb_DBgi7cZgW9S9yLYDLVWq6ZyVNbklN9hETsOCDPDSbw_46Bo_hKAJKZDbpn-61C_gP2wNXxru-G0MhqbZ7X5MJO8p/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>Desert Eagle</h3>
                            <h4>Ржавый кобальт</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="276"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5_MeKyPDJYcRH9BaVfW_k_ywn5GyIn-_huUdO_4rZIfQ69sYOQZbR-Mt4aFsHRUv-DMFiu6Ug9h_JceZOP8X683HzvPm1eDw2rpDxuwu_X-w/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>Desert Eagle</h3>
                            <h4>Заговор</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="277"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5_MeKyPDJYcwX9F6VMSPw9-zfgACA6_Ik7Adbnob5SK1q9vNDHYOMqM9FPTJHVDvbVYF3-u0pthvRbL5eKoyjsw223bbzVMlL4/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>Desert Eagle</h3>
                            <h4>Гипноз</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="278"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz59Ne60IwhkZzvAE69VWfsF5An4ARg06cpiR-i78r8PPFHx5obGYLMkMNpESZGGXf7TZF-p7UNrh_BVfpDfqS_njivqMzsNXRS4-nVExrHa0gpYAg/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>FAMAS</h3>
                            <h4>Остаточное изображение</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="279"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz59Ne60IwhmYzvEAK1fT8ow_QbiNio37M52WZnmo71ScQXrtNfEYuIrNY0ZS8TWXKeEZ1qo70k60aQLKZSLpiK53STvJC5UDDELs8ER/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>FAMAS</h3>
                            <h4>Джинн</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="280"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz59PfWwIzJxdwr9ALFhCaIF8g3tHS83-tRcWdKy_q4LZ168tIqVN-QpYdEYGsGEX_LVZV_8vho51qJUL5SK83_tiHnvOG4IW0D1ujVToCw2k7Y/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>Five-SeveN</h3>
                            <h4>Птичьи игры</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="281"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz59PfWwIzJxdwr9ArVhWvws8RvpHyI818ViWta49oQLLFi28d_YYbB-N9tJHpGBXvKAYV-p7koxh_RUepyBqH662CS7bj1cWEHjrD1WmvjH5OXENuHjvw/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>Five-SeveN</h3>
                            <h4>Обезьянье дело</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="282"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz58Ne-8PDZ1TQfXPqdfUPw2yw3vBhg_7cNqQdr4or4EeA_q4ICXZrd4Mo4fGJXXCKKGMFv07kMxgvJVL5WIpi3q3y3qb3BKBUS1IsSPCQ/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>Galil AR</h3>
                            <h4>Эко</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="283"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgposbaqKAxf0v73cCxX7eOwmIWInOTLP7LWnn8f7ZJ13rjC8NjxilLkqBduaj_ycdSWJldvZAuF-gPsxuvs1MTovZTJymwj5Hd3abH-_Q/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>Glock-18</h3>
                            <h4>Сумеречная галактика</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="284"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz58OOy2OwhkZzvFDa9dV7g2_Rn5DDQx7cl3a9qz87ITJBLmsoHEYbAtMNEeF8iBU_CFNVqrv09sgqJfKsTbqCu5iyrob2deCBC65Ctazz387ae9/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>Glock-18</h3>
                            <h4>Дух воды</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="285"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz52YOLkDyRufgHMAqVMY_Q3ywW4CHZ_-_hiWNu57oQJO12x49epbuV4aZ0RAcLWX6OGZA2puB1pgqUMLpWBoC671XngOD1ZCEG_rmMAkbDWvORp1mcIAy_njWgGDWs/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>M4A1-S</h3>
                            <h4>Атомный сплав</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="286"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz56P7fiDzZ2TQvLDaVaY_g_8AH5BGljvJI2BI7noOlSKAW9vYGVNuUpNIlJTMnRXaLXYw6s40w6iaJfKsTYvmqxirPZAJU6/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AK-47</h3>
                            <h4>Поверхностная закалка</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="287"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou-6kejhz2v_Nfz5H_uO3mr-ZkvPLPu_Qx3hu5Mx2gv2P8I-g0VHtqUNlNmimLdCRdFdoYFCErwC4xLu6jJbpuc-dnydq73Jw5GGdwULhEbgmIQ/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>M4A1-S</h3>
                            <h4>Хот-род</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="288"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou-6kejhz2v_Nfz5H_uO3mb-GkuP1P6jummJW4NE_2-zHpN2g3Vfj-kFvZ2ChJtfEJ1M2YF_Sq1LqkOm515fpup-cyHFluD5iuyj8q1fJzg/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>M4A1-S</h3>
                            <h4>Рыцарь</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="289"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou-6kejhz2v_Nfz5H_uO1gb-Gw_alfqjuhWJd7ctyj9bM8Ij8nVn6_ERkNT_0IoXHIQI9M1CE_1G3ku6605K-us7InyNhvnQnt37VnkOx1QYMMLJOVeO32Q/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>M4A1-S</h3>
                            <h4>Шедевр</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="290"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou-6kejhjxszYfi5H5di5mr-GkvP9JrafwDtV7cAl2uiYpoqt3Q3n-kNkZWCmINTHe1I_YgrV-wS8xb-91p_vuoOJlyUlgXdlZw/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>M4A4</h3>
                            <h4>Посейдон</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="291"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz52YOLkDzRyTQmWAPRhXfs58Rv4GyY-18pmUN6j-vUAelnp4oqQMOZ5MN9IHJbXWvDUblys7k0x1KRULJCO9n68iy3gOzheRVO1rWyhmNc8/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>M4A4</h3>
                            <h4>龍王 (Король драконов)</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="292"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou6ryFBRv7OTAeClH48miq4iOluHtfeOCxToIupAgj7qUrd-kigXl_UU_ZW77do6UdAY8YluDqAe9wee-jJWi_MOexHMtiag/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>MP7</h3>
                            <h4>Заклятый враг</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="293"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz51O_W0DzRyTQrNF6FhXfsu_Rn5DBg_7cNqQdr4rupWfFq6t9bFNeZ4ZNlIHMSEXfLXZV2v7U1t0aFeLpLYoH-53iy9OHBKBURi3EYcOg/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>Nova</h3>
                            <h4>Антиквариат</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="294"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz51O_W0DzRyTRfSE6lQW8o0-x7tNio37M52WZnvoOlSKwm9soTANeF_YtBOGZGGDqSCZgv8uBow1aIIfJGJqXju2X64JC5UDB-VqG4m/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>Nova</h3>
                            <h4>Расцветающая ветка</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="295"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5zP_PnYGc3TQfXPqZfSvA29Tf8W3diuPhuUdO_4rZIKw3o54fBYLcoYt8YHJGFWfWAMgz1u0o_gvVaepeP9njo3y_hPmhfUw2rpDzTyaClDQ/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>P2000</h3>
                            <h4>Кортисейра</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="296"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5zP_PnYGc3TQXPPq9NT_w87TfuBTI319cxBIfmyLkUKEqw296fZOhoLtFNScLSX_CFY1_6v09pialbfZCI9Srmj3-4O24MCELtq29WzuHT6OB1wjFB2Nmb0Uc/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>P2000</h3>
                            <h4>Океанская пена</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="297"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5rZrblDzZ2TRSQVPBhX_Qo4A3gNio37M52WZmzpOpRe1rttNeTOuEkMdwdHcbXCfbXZAuv6x87ifJYJsGJpSLri37hJC5UDK03rOoN/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>P250</h3>
                            <h4>Картель</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="298"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopujwezhjxszFfjNH9eO7kYSCgvq6Z-mHwjIFu8Yl3-3Hotr03QC28ktkYmGnIoXAdARoZVzZ_VW7yeu7jIj84sqiLuLNUw/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>P250</h3>
                            <h4>Франклин</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="299"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5rZrblDzRyTRSQVPBhTvA8_QbpDRg_7cNqQdr4o-lQLQTsvILFO7EoNY5ITsbRDveGMAj460Jsgqlce53bqSnp2369bHBKBURYOo6ZcQ/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>P250</h3>
                            <h4>Роспись</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="300"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5rZrblDzRyTRSQVPBhUfQ08AngCBg_7cNqQdr48ukHLA3m4IaQMLYvNdxEG8ODDPLSYAj6vk0606QJepaIoCK92CztPnBKBUTWIFz05A/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>P250</h3>
                            <h4>Покойник</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="301"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5rZrblDzZqTRSQVPBhXvA78A3oNjcz4cl3a9qz87ITJBK84NfOZ7AqNNlPGsSEDqOGZwH-7EtrhqUOepOB8yy-i368bGwOWBDo5Ctaz3OtRfn1/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>P250</h3>
                            <h4>Цвета прибоя</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="302"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5rbbOKMTpYYQjLFahbTsoqrVjTBS414NMtAY_l9uJWKgrpvIfOYOYsY4tOH8LVWaKEMA2s6hltgaBbJ8DY9Hi8jDOpZDlvRxYzBw/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>P90</h3>
                            <h4>Хладнокровный</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="303"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5rbbOKMyJYdhbDBq9QY-VjpDfuGyYk5_huUdO_4rZIeQ7q5oSTZrAsOY5OF8mCWaXVMgv_7k1ph6JUKMPY8Xzq2S-7PmlbWQ2rpDxpHIWlgA/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>P90</h3>
                            <h4>Изумрудный дракон</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="304"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5rbbOKMyJYYl2SPrRMVfI1-jfhDCM7_cotB4LjpewCcQ3m5tGTMbh9NY0aSsODC_7TZA_-uE9rh6Fee5KPoyzo1TOpZDk0vhNJlA/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>P90</h3>
                            <h4>Треугольник</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="305"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5oN-KnYmdYcRH9EqNfTqdqywHiHSIg_sJtQN65-YQLLFi28d_YYON_YdtOGcLSWP6EZQn9v0ts0_JZKJaAoy7p237vOTwMDke5q2tWy_jH5OW3G4_IIA/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>SCAR-20</h3>
                            <h4>Кардио</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="306"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5oN-KnYmdYcRH9EqNfTso57RrpERg_7cNqQdr49ONUfV274IDDMuQrYY1JScnVW6WPY1-r6k9uiaJfesSApy7o2C3tPHBKBUQTeosiOQ/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>SCAR-20</h3>
                            <h4>Сайрекс</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="307"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopbmkOVUw7PvRTjVX4sizhr-Jm_buNoTBn2Va1810i__Yu96miVe180NtMDiid9eRIVM2Nw3S8wK8lOfsgMe5tcydz3NmvnMhtH7D30vgioRUu2k/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>SCAR-20</h3>
                            <h4>Пятна от краски</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="308"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5oM7bgZghkZzvRBvULD8o57RrpERg_7cNqQdr4o-xQKAi954eSYLUsNthIHMLXX_DXYAv-7Rk5g6ELfJ2Ip3y73368MnBKBUTfd5LARA/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>SG 553</h3>
                            <h4>Сайрекс</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="309"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5uJ_OKIz5rdwrBBLJhX-AF_wnlBCY818pmUN6j-vVWcV7otIDGNOR6NoxJS8GDUqfSMg7160pr1qJdLMSJqSnn2y7gPGdeRVO1rT_447Kf/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>USP-S</h3>
                            <h4>Кайман</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="310"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5uJ_OKIz5rdwrBBLJhXfgF8QTpCjMg4cRcRtKyyLYDLVWq6ZyTM-YpON1PFpOCW_KHNQyp4xg_0vQOKJPbqHjvjnnrOThbXhfrqD0MhqbZ7Q-uebBQ/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>USP-S</h3>
                            <h4>Сыворотка</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="311"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/fWFc82js0fmoRAP-qOIPu5THSWqfSmTELLqcUywGkijVjZYMUrsm1j-9xgEObwgfEh_nvjlWhNzZCveCDfIBj98xqodQ2CZknz5jObLlYWNYcRH9Ga0PDKRuywvtGy4m6dRcWdKy_q4LZ128tYbCNbIuMotJHMCEWKOEZQ6u6k1r1KBZK5fYoyu91HjsPG9ZDhP1ujVThKnnncc/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>XM1014</h3>
                            <h4>Спокойствие</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="312"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot7HxfDhjxszJemkV08y5nY6fqPP9ILrDhGpI18h0juDU-MLx2gKy8xFqMDr2IIORcAU6MlnS_Vjtxu7rhcK-u5-cyXZqsiEg7HnUgVXp1kpd_x09/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AK-47</h3>
                            <h4>Буйство красок</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="313"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopuP1FAR17OORIQJR5N2mkZeEmPPLP7LWnn8f7ZIm3r2Zodz20A22-hFkYDumLITBcFA4ZQqFqFTvx-nujMW4u8-dymwj5HeKrOWJ7A/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>P90</h3>
                            <h4>Резной приклад</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="314"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot621FAR17PLfYQJP7c-ikZKSqPv9NLPFqWdQ-sJ0xL-Qoomm2wHk_0A6YWzzd9LHe1I4MFyD_Vi2lO7ogMTptZjPySE37iQ8pSGKluvjCzA/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AWP</h3>
                            <h4>Элитное снаряжение</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="315"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgposr-kLAtl7PLZTjlH_9mkgIWKkPvxDLDEm2JS4Mp1mOjG-oLKhF2zowcDPzixc9OLcw82ZlyF8wC8wb251MW4tcifmydi7CEn4HiPlhyy1BxJbeNshqPIHELeWfJvK5CfiA/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>Desert Eagle</h3>
                            <h4>Дракон-предводитель</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="316"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpouLWzKjhjxszGfitD09SvhIWZlfL1IK_ummJW4NFOhujT8om7jVfi_xZtMjjxJtLGdQ5oMF7Z-AC8w-jm1J-1upvAwXZh6CkjtizbyQv3308wMAGOhw/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>Nova</h3>
                            <h4>Скоростной зверь</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="317"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpoo7e1f1Jf0Ob3ZDBSuImJhJKCmvb4ILrTk3lu5cB1g_zMu46jjAGy80c_ajqgd9OTdFRoZl_V_VG5xr_r1pO9vMvNyidhs3Rztn7D30vgvDNIovc/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>UMP-45</h3>
                            <h4>Первобытный саблезуб</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="318"><img
                            src="https://cdn.csgo.com/item/P250 | Азимов (После полевых испытаний)/300.png" alt="#" />
                        <div class="item-name">
                            <h3>P250</h3>
                            <h4>Азимов</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="319"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot6-iFAR17PLddgJR-926mI-chMj5Nr_Yg2YfsZMk2bHAoIii2VG2_BBkYW7xJoaXcwY6YF_Tr1fvl-ru15LuuM-czGwj5HcAsd6pzQ/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AUG</h3>
                            <h4>Скорая стая</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="320"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopbmkOVUw7PTbTi5B7c7kxL-Jm_j7N6jBmXlF18h0juDU-MKh21Kw_EttNmr7cY6TdAU5NAzZ_wK4ye260MC9tZ7Jy3dlu3QisSzbgVXp1slTo5Ac/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>SCAR-20</h3>
                            <h4>Кровавый спорт</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="321"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpovrG1eVcwg8zPYgJSvozmxL-CmufxIbLQmlRV-sR2hef--InxgUG55URuYWqncdWXIFc8Yl-DqQC2yefvhMW56s7NwHA1s3Qq5iyPzhbhgUlSLrs4z7WVPcs/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>P2000</h3>
                            <h4>Императорский дракон</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="322"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou-6kejhjxszFJTwW09izh4-HluPxDKjBl2hU18h0juDU-MKt0Fex-kpkMTumJobEdlU7ZFCF-AO4wOnv0Mft752azyRh7CZ2ty2MgVXp1k8SoycS/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>M4A4</h3>
                            <h4>Безлюдный космос</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="323"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou6r8FAR17P7YKAJM7c61nZO0m_7zO6_ummpD78A_ib-S8I3z21K1qUs_ZWymd4XEIAQ8NQnY-FG7kry6hsW5vZ7PzyZk6z5iuygRas06gw/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>MP9</h3>
                            <h4>Воздушный шлюз</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="324"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot6-iFABz7PLddgJR9diJmYWKk8j4OrzZglRd6dd2j6eSpt-g0QOx-0ZpZm_wLdCQJgE5ZFzRqVK4wr_m18S_tMnAzHJmv3Yh-z-DyK03Z98k/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>AUG</h3>
                            <h4>Сид Мид</h4>
                        </div>
                    </div>
                    <div class="item item-classified" data-drop-id="{drop_id}" data-item-id="325"><img
                            src="https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpoor-mcjhnwMzcdD4b08-jhIWZlP_1IbzUklRd4cJ5ntbN9J7yjRqx-BY-MGvzcoeVJ1drYVrX81HolOfqgpa_7pvJwHsy6XNz5CvclxW-n1gSOaNQCgyp/206x154"
                            alt="#" />
                        <div class="item-name">
                            <h3>Tec-9</h3>
                            <h4>Топливный инжектор</h4>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $('html, body').animate({
                scrollTop: $(".live-drops").offset().top
            }, 0);
        </script>
        <?php include 'footer.tpl'; ?>
    </div>
    <!--noindex-->
    <script src="/templates/Default/js/functions.min.js?v=60" type="text/javascript"></script>

    <!-- VK Widget -->
    <div id="vk_community_messages"></div>
    <script type="text/javascript">
        VK.Widgets.CommunityMessages("vk_community_messages", 111, {
            tooltipButtonText: "Есть вопрос?"
        });
    </script>
    <div style="display:none;"><audio preload="" id="case_open">
            <source src="/templates/Default/sounds/case_open.wav" type="audio/wav"></audio><audio preload=""
            id="case_scroll">
            <source src="/templates/Default/sounds/case_scroll.wav" type="audio/wav"></audio><audio preload=""
            id="item_reveal">
            <source src="/templates/Default/sounds/item_reveal.wav" type="audio/wav"></audio></div>
    <!--/noindex-->
</body>

</html>
<?php 

$casesType = $db->getAll('SELECT * FROM `cases_type` ORDER BY `rank` DESC');
$cases = [];
foreach ($casesType as $type) {
	$nCases = $db->getAll('SELECT name, url, price, image FROM cases WHERE type=?i and enabled=1', $type['id']);
	$cases[] = ['name' => $type['name'], 'cases' => $nCases ];
}

$index = 1;

?>


<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="content-language" content="ru" />
	<meta name="viewport" content="width=1200">
	<link rel="shortcut icon" href="/favicon.ico" />
	<meta property="vk:title" content="Открывай бесплатный кейс CS:GO каждый час на WinDrop.ru!">
	<meta property="vk:description"
		content="Не пропусти! Переходи по ссылке и участвуй АБСОЛЮТНО БЕСПЛАТНО! Бегом открывать))))">
	<meta property="vk:text"
		content="Не пропусти! Переходи по ссылке и участвуй АБСОЛЮТНО БЕСПЛАТНО! Бегом открывать))))">
	<meta property="vk:url" content="https://windrop.ru/case/free">
	<meta property="vk:image" content="https://windrop.ru/img/btn_free_case_banner.jpg">
	<meta property="og:type" content="website">
	<meta property="og:title" content="Открывай бесплатный кейс CS:GO каждый час на WinDrop.ru!">
	<meta property="og:description"
		content="Не пропусти! Переходи по ссылке и участвуй АБСОЛЮТНО БЕСПЛАТНО! Бегом открывать))))">
	<meta property="og:site_name" content="WinDrop.ru">
	<meta property="og:url" content="https://windrop.ru/case/free">
	<meta property="og:image" content="https://windrop.ru/img/btn_case.jpg">
	<link media="screen" href="templates/Default/css/main.min.css" type="text/css" rel="stylesheet" />

	<script src="https://use.fontawesome.com/b6ea848141.js" type="text/javascript"></script>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <link media="screen" href="/templates/Default/js/flipclock/flipclock.css" type="text/css" rel="stylesheet" />
    <script src="/templates/Default/js/flipclock/flipclock.min.js" type="text/javascript"></script>
    <script src="/templates/Default/js/fontawesome.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" type="text/javascript"></script>
    <script src="/templates/Default/js/jssor.slider-23.1.1.mini.js" type="text/javascript"></script>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Кейсы КС ГО, Открытие CS GO кейсов</title>
	<meta name="description" content="Кейсы КС ГО с моментальной отправкой вещей. Бесплатный кейс каждый час" />
	<meta name="keywords" content="кейсы кс го, кейсы cs go, вещи кс го, cs кейсы, кейсы csgo, кс го кейсы" />
</head>

<body>
	<script type="text/javascript">
		var user_url = '';
	</script>
	<!-- Модальное окно реального выигрыша -->
	<div class="modal modal-payment" id="modal-payment">

		<h1>Пополнение баланса</h1>

		<div id="headers">
			<h2 id="weapon_name">
				0 <i class="fa fa-rub"></i>
			</h2>
			<h3>Ваш текущий баланс</h3>
		</div>
		<div class="alert-red" id="not-enought-money" style="display: none;">
			У вас недостаточно денег на балансе для открытия кейса
			<h3>Введите сумму для пополнения:</h3>
		</div>
		<form method="post" action="" onsubmit="unitpay(); return false;">

			<div class="sum">
				<button type="button" class="btn btn-red" onclick="change_sum( '-' );">
					<span class="icon"></span>
				</button>

				<input type="text" name="sum" value="Введите сумму пополнения" class="sum" id="sum"
					onfocus="if( this.value == 'Введите сумму пополнения') this.value = ''; else if( this.value == '' ) this.value='0'; $(this).addClass('focused');"
					onblur="if( this.value == '' ) { this.value='Введите сумму пополнения'; $(this).removeClass('focused'); }"
					maxlength="6" />

				<button type="button" class="btn btn-red" onclick="change_sum( '+' );">
					<span class="icon"></span>
				</button>
			</div>

			<input type="hidden" name="action" value="init" />

			<div class="actions">
				<button type="submit" disabled="disabled" class="btn btn-red"><i class="fa fa-rub"></i>
					Пополнить</button>
				<button type="button" class="btn btn-red"><span class="icon-skinpay"></span> Скинами</button>
				<div class="clearfix"></div>
			</div>

		</form>

		<div class="bonuses">
			<h4>Бонусы при пополнении баланса</h4>

			<div class="bonus">
				<h5>> 250 <i class="fa fa-rub"></i></h5>
				<span>5%</span> от суммы пополнения
			</div>

			<div class="bonus">
				<h5>> 500 <i class="fa fa-rub"></i></h5>
				<span>10%</span> от суммы пополнения
			</div>

			<div class="bonus">
				<h5>> 1 000 <i class="fa fa-rub"></i></h5>
				<span>20%</span> от суммы пополнения
			</div>

			<div class="clearfix"></div>

			<div class="text">Бонус зачисляется на Ваш баланс<br /> сразу же после пополнения</div>

		</div>

	</div>
	<!-- Модальное окно реального выигрыша -->
	<div class="modal modal-coupon" id="modal-coupon">

		<h1>Активация промокода</h1>
		<input type="text" name="coupon" value="" placeholder="Введите промокод" maxlength="15" />

		<div class="actions">
			<button type="submit" class="btn btn-red" onclick="coupon_activate();">Активировать</button>
			<div class="clearfix"></div>
		</div>

		<div class="text" id="text-error"></div>
		<div class="text text-success" id="text-success"></div>

		<h3>После активации промокода &mdash; деньги начисляются на баланс мгновенно</h3>

	</div>
	<div class="wrapper">

		<a href="#" class="modal-close"></a>
		<div class="modal-bg"></div>
		
		<!-- Header -->
		<?php include 'header.tpl'; ?>

		<div id="slider">
			<div data-u="slides" id="slider-slides">
				<div>
					<div class="slider" onclick="window.open('https://vk.com/wall-145470431_16', '_blank');">
						<div class="container">
							<h1 class="darimbabki">Дарим деньги при<br />пополнении баланса</h1>
							<div class="text">Пополняй баланс на сумму от 250 руб<br />и получай в подарок до 10 000 руб
							</div>
							<a href="#" class="button">Подробнее об акции</a>
						</div>
					</div>
				</div>

				<div>
					<div class="slider slider-2" onclick="window.open('https://vk.com/wall-145470431_17', '_blank');">
						<div class="container">
							<h1>Кейс в подарок</h1>
							<div class="text">Открой 5 любых одинаковых кейсов &mdash;<br />получи 6-й абсолютно
								бесплатно</div>
							<a href="#" class="button">Подробнее об акции</a>
						</div>
					</div>
				</div>

				<div>
					<div class="slider slider-3" onclick="window.open('https://vk.com/wall-145470431_18', '_blank');">
						<div class="container">
							<h1>Дарим 20 <i class="fa fa-rub"></i> на счет!</h1>
							<div class="text">Просто зарегистрируйся на сайте и<br />вступи в нашу группу ВК. Деньги
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



		<div class="cases">

			<div class="container">

				<?php
				foreach ($cases as $caseType){
					echo "<h1>{$caseType['name']}</h1>";

					foreach ($caseType['cases'] as $case) {
						echo "<div class='case case-{$index}'>
						<a href='{$case['url']}'>
							<img src='{$case['image']}' alt='{$case['name']}' />
							<div class='price'>
								{$case['price']} <i class='fa fa-rub'></i>
							</div>
							<button type='button'>Открыть за {$case['price']} <i class='fa fa-rub'></i></button>
							<h3>{$case['name']}</h3>
						</a>
					</div>";
						$index++;
					}
					echo "<div class='clearfix'></div>";
				}
				?>
			</div>
		</div>


		<script type="text/javascript">
            $('html, body').animate({
                scrollTop: $(".live-drops").offset().top
            }, 0);
        </script>

		<div class="guarantees">

			<h1 class="guarantees_h1">Гарантии LuxDrop</h1>

			<div class="container">

				<div class="guarantee">
					<img src="/templates/Default/images/guarantee-1.png" />
					<h3>Все в наличии</h3>
					<div class="descr">
						В продаже присутствуют только те вещи, которые есть в наличии у наших ботов в Steam
					</div>
				</div>

				<div class="guarantee">
					<img src="/templates/Default/images/guarantee-2.png" />
					<h3>Без обмана</h3>
					<div class="descr">
						Мы не вмешиваемся в процесс покупки и откытия кейсов
					</div>
				</div>

				<div class="guarantee">
					<img src="/templates/Default/images/guarantee-3.png" />
					<h3>Лучшие цены</h3>
					<div class="descr">
						Продаем кейсы по самым низким ценам. Никаких комиссий! Возможность продажи вещей по выгодной
						цене
					</div>
				</div>

				<div class="guarantee">
					<img src="/templates/Default/images/guarantee-4.png" />
					<h3>Моментальное получение</h3>
					<div class="descr">
						Максимально быстрая передача предметов в Steam через собственных ботов в режиме 24/7.
						Оперативная техподдержка
					</div>
				</div>

			</div>

		</div>


		<?php include 'footer.tpl'; ?>

	</div>
	<!--noindex-->
	<script src="/templates/Default/js/functions.min.js?v=60" type="text/javascript"></script>
	
	<div style="display:none;">
		<audio preload="" id="case_open">
			<source src="/templates/Default/sounds/case_open.wav" type="audio/wav">
		</audio>
		<audio preload="" id="case_scroll">
			<source src="/templates/Default/sounds/case_scroll.wav" type="audio/wav">
		</audio>
		<audio preload="" id="item_reveal">
			<source src="/templates/Default/sounds/item_reveal.wav" type="audio/wav">
		</audio>
	</div>
	<!--/noindex-->
</body>

</html>
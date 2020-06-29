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
    <!-- Модальное окно реального выигрыша -->
    <div class="modal modal-payment" id="modal-payment">

        <h1>Баланс</h1>

        <h2 id="weapon_name">
            0 <i class="fa fa-rub"></i>
        </h2>
        <h3>Ваш текущий баланс</h3>

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
                <h5>&gt;1 000 <i class="fa fa-rub"></i></h5>
                <span>5%</span> от суммы пополнения
            </div>

            <div class="bonus">
                <h5>&gt;3 000 <i class="fa fa-rub"></i></h5>
                <span>10%</span> от суммы пополнения
            </div>

            <div class="bonus">
                <h5>&gt;5 000 <i class="fa fa-rub"></i></h5>
                <span>20%</span> от суммы пополнения
            </div>

            <div class="clearfix"></div>

            <div class="text">Бонус зачисляется на Ваш баланс<br /> сразу же после пополнения</div>

        </div>

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




        <div class="article">
            <div class="container">
                <h1>FAQ</h1>
                <div class="text">
                    <p><span style="font-size:24px;"><br></span></p>
                    <p><span style="font-size:24px;">1. Как зарегистрироваться на сайте?</span></p>
                    <ul>
                        <li>
                            <p>Авторизуйтесь через «Steam» или «Вконтакте», а затем перейдите на страницу своего
                                профиля;</p>
                        </li>
                        <li>
                            <p>На странице профиля введите ссылку на обмен из вашего аккаунта Steam;</p>
                        </li>
                        <li>
                            <p>Убедитесь, что на вашем аккаунте Steam нет «удержания обменов», иначе вы не сможете
                                моментально получать вещи;</p>
                        </li>
                    </ul>
                    <p><br></p>
                    <p><span style="font-size:24px;">2. Что такое Steam ссылка на обмен и где её найти?</span></p>
                    <p>Ссылка на обмен (Trade-ссылка) дает возможность моментально получать вещи и совершать обмены с
                        пользователями, которых нет у вас в друзьях.</p>
                    <p>Ссылку на обмен можно найти здесь</p><br><br>
                    <p><span style="font-size:24px;">3. Как узнать, что ссылка на обмен работает?</span></p>
                    <p>Удостовериться в правильности работы ссылки можно здесь – https://csgo.tm/check/</p>
                    <p>Ссылка может не работать по следующим причинам:</p>
                    <ul>
                        <li>
                            <p>Скрыт инвентарь в настройках приватности</p>
                        </li>
                        <li>
                            <p>На ваш аккаунт наложены ограничения обмена и использования Торговой площадки Steam</p>
                        </li>
                    </ul>
                    <p>С полным списком ограничений можно ознакомиться <a
                            href="https://support.steampowered.com/kb_article.php?ref=1047-EDFM-2932&amp;l=russian"
                            target="_blank" rel="external noopener noreferrer">тут</a></p><br><br>
                    <p><span style="font-size:24px;">4. Как открыть кейс? Что значит «Временно недоступен»?</span></p>
                    <p>Чтобы открыть кейс на сайте:</p>
                    <p>Пополняйте баланс аккаунта на сумму, необходимую для открытия нужных вам кейсов;</p>
                    <p>Если на кейсе есть надпись «временно недоступен», значит в настоящий момент на боте нет вещей,
                        которые указаны в кейсе.</p><br><br>
                    <p><span style="font-size:24px;">5. Как пополнить баланс?</span></p>
                    <p>Перейдите на страницу своего профиля, впишите нужную сумму и нажмите «пополнить»;</p>
                    <p>Платеж можно произвести любым удобным для вас способом: WebMoney, банковская карта, Яндекс
                        Деньги, QIWI, мобильные платежи и т.д; Кроме того, вы можете пополнить баланс скинами через
                        сервис SkinPay;</p>
                    <p>На нашем сайте вы не сможете использовать деньги, которые находятся на балансе в аккаунте Steam.
                    </p><br><br>
                    <p><span style="font-size:24px;">6. Как получить вещь из открытого кейса?</span></p>
                    <p>Чтобы получить вещь:</p>
                    <p>Нажмите «забрать» после открытия кейса. Зайдите в свой аккаунт Steam через официальный сайт или
                        приложение.</p>
                    <p>В правом верхнем углу появится иконка сообщения. Нажмите на нее, а затем перейдите на страницу
                        «новых предложений обмена».</p>
                    <p>Дальше нужно поставить галочку около «подтвердить обмен», а затем нажать на кнопку «принять
                        обмен».</p>
                    <p>Отправка вещей в Steam происходит в автоматическом режиме в течение нескольких минут после
                        нажатия кнопки «забрать» на LuxDrop.ru.</p><br>
                    <p><span style="font-size:24px;">7. Какое время после открытия кейса можно получить вещь?</span></p>
                    <p>Вам нужно забрать вещь в течение часа после открытия кейса, ориентируясь на таймер обратного
                        отсчета. Если вы не заберете вещь в течение часа, она будет автоматически продана сайту, и вы
                        получите её стоимость на свой баланс.</p><br>
                    <p><span style="font-size:24px;">8. Что делать, если вещь из кейса не пришла?</span></p>
                    <p>Обмен может не прийти из-за следующего:</p>
                    <ul>
                        <li>
                            <p>Вы не забрали вещь в течение часа после открытия кейса</p>
                        </li>
                    </ul>
                    <p>Если после открытия кейса прошло меньше часа, то вы можете забрать вещь в своем профиле.</p>
                    <p>Если прошло больше часа, то вещь будет автоматически продана сайту, и вы получите её стоимость на
                        свой баланс.</p>
                    <ul>
                        <li>
                            <p>У вас есть ограничения на обмен вещами в аккаунте Steam</p>
                        </li>
                        <li>
                            <p>У вас скрыт инвентарь. Откройте инвентарь в настройках приватности аккаунта Steam</p>
                        </li>
                        <li>
                            <p>Указана неверная ссылка на обмен в вашем профиле. Проверьте, совпадают ли ссылки,
                                указанные на странице вашего аккаунта и в Steam</p>
                        </li>
                        <li>
                            <p>Сбои в работе Steam</p>
                        </li>
                    </ul>
                    <p><br></p>
                    <p><span style="font-size:24px;">9. Куда обращаться, если есть вопросы?</span></p>
                    <p>При возникновении вопроса, ответа на который нет в данном FAQ, напишите нашему
                        онлайн-консультанту в правом нижнем углу сайта или на почту <a
                            href="mailto:luxdrop@yandex.ru">luxdrop@yandex.ru</a>.
                    </p>
                </div>
            </div>
        </div>




        <?php include 'footer.tpl'; ?>

    </div>
    <!--noindex-->
    <script src="/web/20170501000703js_/http://luxdrop.ru/templates/Default/js/functions.js?v=31"
        type="text/javascript"></script>
    <!-- Yandex.Metrika counter -->
    <script type="text/javascript">
        (function (d, w, c) {
            (w[c] = w[c] || []).push(function () {
                try {
                    w.yaCounter43048464 = new Ya.Metrika({
                        id: 43048464,
                        clickmap: true,
                        trackLinks: true,
                        accurateTrackBounce: true,
                        webvisor: true
                    });
                } catch (e) {}
            });
            var n = d.getElementsByTagName("script")[0],
                s = d.createElement("script"),
                f = function () {
                    n.parentNode.insertBefore(s, n);
                };
            s.type = "text/javascript";
            s.async = true;
            s.src = "https://mc.yandex.ru/metrika/watch.js";
            if (w.opera == "[object Opera]") {
                d.addEventListener("DOMContentLoaded", f, false);
            } else {
                f();
            }
        })(document, window, "yandex_metrika_callbacks");
    </script> <noscript>
        <div><img src="https://web.archive.org/web/20170501000703im_/https://mc.yandex.ru/watch/43048464"
                style="position:absolute; left:-9999px;" alt="" /></div>
    </noscript>
    <!-- Google Analytics -->
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script',
            'https://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-44993531-5', 'auto');
        ga('send', 'pageview');
    </script>
    <!--LiveInternet counter-->
    <script type="text/javascript">
        document.write("<a href='//web.archive.orghttp://www.liveinternet.ru/click' " +
            "target=_blank><img src='//web.archive.orghttp://counter.yadro.ru/hit?t14.1;r" +
            escape(document.referrer) + ((typeof (screen) == "undefined") ? "" :
                ";s" + screen.width + "*" + screen.height + "*" + (screen.colorDepth ?
                    screen.colorDepth : screen.pixelDepth)) + ";u" + escape(document.URL) +
            ";" + Math.random() +
            "' alt='' title='LiveInternet: показано число просмотров за 24" +
            " часа, посетителей за 24 часа и за сегодня' " +
            "border='0' width='88' height='31' style='display:none;'><\/a>");

        (function () {
            var widget_id = 'preW2B15wT';
            var d = document;
            var w = window;

            function l() {
                var s = document.createElement('script');
                s.type = 'text/javascript';
                s.async = true;
                s.src = '//web.archive.orghttp://code.jivosite.com/script/widget/' + widget_id;
                var ss = document.getElementsByTagName('script')[0];
                ss.parentNode.insertBefore(s, ss);
            }
            if (d.readyState == 'complete') {
                l();
            } else {
                if (w.attachEvent) {
                    w.attachEvent('onload', l);
                } else {
                    w.addEventListener('load', l, false);
                }
            }
        })();
    </script>
    </script>
    <!--!--noindex---->
</body>

</html>
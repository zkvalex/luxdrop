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
                <button type="button" onclick="skinpay(); return false;" class="btn btn-red"><span
                        class="icon-skinpay"></span> Скинами</button>
                <div class="clearfix"></div>
            </div>

        </form>

        <div class="bonuses">
            <h4>Бонусы при пополнении баланса</h4>

            <div class="bonus">
                <h5>&gt; 250 <i class="fa fa-rub"></i></h5>
                <span>5%</span> от суммы пополнения
            </div>

            <div class="bonus">
                <h5>&gt; 500 <i class="fa fa-rub"></i></h5>
                <span>10%</span> от суммы пополнения
            </div>

            <div class="bonus">
                <h5>&gt; 1 000 <i class="fa fa-rub"></i></h5>
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
        <div class="top-menu">
            <div class="container">

                <a href="/" class="logo"></a>

                <ul>
                    <li><a href="/">Главная</a></li>
                    <li><a href="/coupon/" onclick="modal_open( 'modal-coupon' ); return false;">Промокод</a></li>
                    <li><a href="/faq">FAQ</a></li>
                    <li><a href="/support">Поддержка</a></li>
                </ul>




                <div class="auth">
                    <a href="/auth/steam" class="auth-steam" target="_blank">Войти через Steam</a>
                    <a href="/auth/vk" class="auth-vk" target="_blank">Войти через ВК</a>
                </div>


                <div class="links">
                    <a href="https://vk.com/luxdrop" rel="nofollow" class="link-vk" target="_blank">
                        <span></span>
                        Мы в ВК
                    </a>
                </div>

            </div>
        </div>

        <div id="slider">
            <div data-u="slides" id="slider-slides">
                <div>
                    <div class="slider" onclick="window.open('', '_blank');">
                        <div class="container">
                            <h1>Дарим деньги при<br />пополнении баланса</h1>
                            <div class="text">Пополняй баланс на сумму от 250 руб<br />и получай в подарок до 10 000 руб
                            </div>
                            <a href="#" class="button">Подробнее об акции</a>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="slider slider-2" onclick="window.open('', '_blank');">
                        <div class="container">
                            <h1>Кейс в подарок</h1>
                            <div class="text">Открой 5 любых одинаковых кейсов &mdash;<br />получи 6-й абсолютно
                                бесплатно</div>
                            <a href="#" class="button">Подробнее об акции</a>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="slider slider-3" onclick="window.open('', '_blank');">
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
            <span data-u="arrowleft" class="jssora22l" data-autocenter="2"></span>
            <span data-u="arrowright" class="jssora22r" data-autocenter="2"></span>
        </div>




        <div class="article">
            <div class="container">
                <h1>Поддержка</h1>
                <div class="text">
                    <p><br></p>
                    <p>Наша команда с радостью поможет вам с решением любых вопросов, касающихся работы сайта
                        LuxDrop.ru.</p>
                    <p>При возникновении проблем с пополнением баланса или при обнаружении ошибки в работе сайта,
                        напишите нашему онлайн-консультанту в правом нижнем углу сайта или на почту <a
                            href="mailto:luxdrop@yandex.ru">luxdrop@yandex.ru</a>. Желательно максимально развернуто
                        описать проблему в первом же сообщении, чтобы мы могли оперативно её решить. При возникновении
                        проблемы с выводом вещей, поищите ответ на странице <a href="https://luxdrop.ru/faq.html"
                            target="_blank">FAQ</a>.</p>
                    <p><br></p>Наши реквизиты: INTERNATIONAL BUSINESS SYSTEMS S.R.L., юридическое лицо,
                    зарегистрированное по законодательству Коста-Рики, 3-102-693823, Costa Rica, San Jose, Santa Ana,
                    350 mtrs del restaurante Ceviche del Rey.<br><br><br>
                    <p>Если вы не нашли там решения своей проблемы, то обратитесь в поддержку. В сообщении укажите:</p>
                    <ul>
                        <li>Ссылку на свой профиль на сайте;</li>
                        <li>Название купленного кейса;</li>
                        <li>Название вещи, которая должна прийти;</li>
                        <li>Примерное время открытия кейса.</li>
                    </ul>
                </div>
            </div>
        </div>


        <?php include 'footer.tpl'; ?>

    </div>
    <!--noindex-->
    <script src="templates/Default/js/functions.min.js?v=26" type="text/javascript"></script>

    <!-- VK Widget -->
    <div id="vk_community_messages"></div>
    <script type="text/javascript">
        VK.Widgets.CommunityMessages("vk_community_messages", 145470431, {
            tooltipButtonText: "Есть вопрос?"
        });
    </script>

</body>

</html>
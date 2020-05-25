function Auth() {
  var self = this;

  this.Login = function() {
    Message.Show('\
      <div class="m_close"></div>\
      <div class="m_content_layer"></div>\
      <div class="m_over_layer">\
        <div id="LoginWrapper">\
          <div class="left-form">\
            <iframe name="login_frame" id="login_frame" frameborder="0" style="display: none;"></iframe>\
            <form action="/auth/login" method="POST" id="form_login" target="login_frame">\
  		        <h2>Авторизация</h2><br> \
              <div class="form-row"><input type="text" name="email" id="email" placeholder="Ваша эл. почта"/></div><br>\
              <div class="form-row"><input type="password" name="pass" id="pass" placeholder="Ваш пароль"/></div><br>\
              <div class="form-row"><div id="recaptcha_login" style="width: 224px; height: 76px; margin: 0; overflow:hidden; border-radius: 5px;"></div></div><br>\
              <div class="form-row row-error" id="error_message" style="display: none;"></div><br>\
              <div class="form-row"><button type="submit" id="login_btn" disabled>Войти</button></div><br>\
              <div class="form-row"><a id="toggle_restore">Забыли пароль?</a></div>\
            </form>\
          </div>\
          <div class="right-form">\
  	        <!--h3 style="font-size: 13px;padding-bottom: 23px;">Вход с социальной сети</h3>\
            <div class="social">\
              <a class="facebook" title="Авторизация через Facebook"></a>\
  			      <a class="vk" title="Авторизация через ВКонтакте"></a>\
              <a class="google" title="Авторизация через Google"></a>\
              <a class="twitter" title="Авторизация через Twitter"></a>\
            </div-->\
            <div>\
  			       <h3 style="font-size: 13px;padding-bottom:0px;padding-top: 24px;">Нет аккаунта? / Create an account</h3>\
              <button id="toggle_register">Регистрация</button>\
            </div>\
          </div>\
          <div class="clear"></div>\
        </div>\
        <div id="RestoreWrapper" style="display: none;">\
          <div class="left-form">\
            <iframe name="register_frame" id="restore_frame" frameborder="0" style="display: none;"></iframe>\
  		      <h2>Восстановление</h2><br> \
            <form action="/auth/restore" method="POST" id="form_restore" target="restore_frame">\
              <div class="form-row"><input type="text" name="email" id="email" placeholder="Ваша эл. почта"/></div><br>\
              <div class="form-row"><div id="recaptcha_restore" style="width: 224px; height: 76px; margin: 0; overflow:hidden; border-radius: 5px;"></div></div><br>\
              <div class="form-row row-error" id="error_message" style="display: none;"></div><br>\
              <div class="form-row"><button type="submit" id="restore_btn" disabled>Восстановить</button></div>\
            </form>\
          </div>\
          <div class="right-form">\
            <div>\
              <h3>Есть аккаунт?</h3>\
              <button id="toggle_login">Вход</button>\
            </div>\
          </div>\
          <div class="clear"></div>\
        </div>\
        <div id="RegisterWrapper" style="display: none;">\
          <div class="left-form">\
            <iframe name="register_frame" id="register_frame" frameborder="0" style="display: none;"></iframe>\
            <form action="/auth/register" method="POST" id="form_register" target="register_frame">\
  		        <h2>Регистрация</h2><br> \
              <div class="form-row"><input type="text" name="login" id="login" placeholder="Ваше имя"/></div><br>\
              <div class="form-row"><input type="text" name="email" id="email" placeholder="Ваша эл. почта"/></div><br>\
              <div class="form-row"><input type="password" name="pass" id="pass" placeholder="Ваш пароль"/></div><br>\
              <div class="form-row"><div id="recaptcha_register" style="width: 224px; height: 76px; margin: 0; overflow:hidden; border-radius: 5px;"></div></div><br>\
              <div class="form-row row-error" id="error_message" style="display: none;"></div><br>\
              <div class="form-row"><button type="submit" id="register_btn" disabled>Зарегистрироваться</button></div>\
            </form>\
          </div>\
          <div class="right-form">\
            <div>\
              <h3>Есть аккаунт?</h3>\
              <button id="toggle_login">Вход</button>\
            </div>\
          </div>\
          <div class="clear"></div>\
        </div>\
        <div class="clear"></div></div>', {
      onshow: function() {
        $('#LoginWrapper #email').focus();
        $('.m_close').on('click', function() {
          Message.Hide();
        });

        window.reCaptchaShow = function() {
          try {
            grecaptcha.reset();
          } catch (e) {}

          grecaptcha.render('recaptcha_login', {
            sitekey: window.recaptchaSiteKey,
            callback: function() {
              $('#login_btn').prop('disabled', false);
            }
          });

          grecaptcha.render('recaptcha_restore', {
            sitekey: window.recaptchaSiteKey,
            callback: function() {
              $('#restore_btn').prop('disabled', false);
            }
          });

          grecaptcha.render('recaptcha_register', {
            sitekey: window.recaptchaSiteKey,
            callback: function() {
              $('#register_btn').prop('disabled', false);
            }
          });
        }

        if (!window.grecaptcha) {
          var js = document.createElement('script');
          js.src = '//www.google.com/recaptcha/api.js?onload=reCaptchaShow&render=explicit&hl=ru';
          js.async = true;

          $('head').append(js);
        } else {
          reCaptchaShow();
        }

        $('.social > a.vk').on('click', self.VK);
        $('.social > a.facebook').on('click', self.Facebook);
        $('.social > a.google').on('click', self.Google);
        $('.social > a.twitter').on('click', self.Twitter);
        $('#form_login').on('submit', self.DoLogin);
        $('#form_register').on('submit', self.DoRegister);
        $('#form_restore').on('submit', self.DoRestore);

        $('#toggle_restore').on('click', function() {
          $('#LoginWrapper,#RegisterWrapper').hide();
          $('#RestoreWrapper').show();
          $('#RestoreWrapper #email').focus();
          $('#RestoreWrapper #error_message').hide().html('');
        })

        $('#RegisterWrapper,#RestoreWrapper').find('button#toggle_login').on('click', function() {
          $('#RegisterWrapper,#RestoreWrapper').hide();
          $('#LoginWrapper').show();
          $('#LoginWrapper #email').focus();
          $('#LoginWrapper #error_message').hide().html('');
        });

        $('#toggle_register').on('click', function() {
          $('#LoginWrapper,#RestoreWrapper').hide();
          $('#RegisterWrapper').show();
          $('#RegisterWrapper #login').focus();
          $('#RegisterWrapper #error_message').hide().html('');
        });
      }
    });
  };

  this.DoLogin = function() {
    var self = this, form_login = $('#form_login');
    var email = form_login.find('#email'), pass = form_login.find('#pass');

    if (!isEmail(email.val())) {
      email.focus();
      return false;
    }

    if ((pass.val().trim()).length < 6) {
      pass.focus();
      return false;
    }

    $('#LoginWrapper #error_message').hide().html('');
    $('#login_frame').replaceWith('<iframe name="login_frame" id="login_frame" frameborder="0" style="display: none;"></iframe>');

    return true;
  };

  this.OnLogin = function(response) {
    if (response.result) {
      window.location.reload(true);
    } else {
      try {
        grecaptcha.reset();
      } catch (e) {}

      $('#LoginWrapper #error_message').show().html(response.error);
    }
  };

  this.onLogin = function(response) {
    if (response.result) {
      window.location.reload(true);
    } else {
      try {
        grecaptcha.reset();
      } catch (e) {}

      $('#form_auth #error_message').show().html(response.error);
    }
  };

  this.DoRegister = function() {
    var self = this, form_register = $('#form_register');
    var login = form_register.find('#login'), email = form_register.find('#email'), pass = form_register.find('#pass');

    if (!(login.val()).match(/^[a-zA-Zа-яА-ЯёЁ0-9_\-\s]+$/i)) {
      login.focus();
      return false;
    }

    if (!isEmail(email.val())) {
      email.focus();
      return false;
    }

    if ((pass.val().trim()).length < 6) {
      pass.focus();
      return false;
    }

    $('#RegisterWrapper #error_message').hide().html('');
    $('#register_frame').replaceWith('<iframe name="register_frame" id="register_frame" frameborder="0" style="display: none;"></iframe>');

    return true;
  };

  this.OnRegister = function(response) {
    if (response.result) {
      window.location.reload(true);
    } else {
      $('#RegisterWrapper #error_message').show().html(response.error);
    }
  };

  this.onRegister = function(response) {
    if (response.result) {
      window.location.reload(true);
    } else {
      $('#form_reg #error_message').show().html(response.error);
    }
  };

  this.DoRestore = function() {
    var self = this, form_restore = $('#form_restore');
    var email = form_restore.find('#email');

    if (!isEmail(email.val())) {
      email.focus();
      return false;
    }

    $('#RestoreWrapper #error_message').hide().html('');
    $('#restore_frame').replaceWith('<iframe name="restore_frame" id="restore_frame" frameborder="0" style="display: none;"></iframe>');

    return true;
  };

  this.OnRestore = function(response) {
    if (response.result) {
      $('.m_content').html('<div class="restore-message">'+response.result+'</div>');
    } else {
      $('#RestoreWrapper #error_message').show().html(response.error);
    }
  };

  this.onRestore = function(response) {
    if (response.result) {
      $('#form_restore').html('<div class="restore-message">'+response.result+'</div><br /><div class="form-row"><span><a onclick="Auth.SwitchForm(\'form_auth\');">Назад</a></span></div>');
    } else {
      $('#form_restore #error_message').show().html(response.error);
    }
  };

  this.VK = function() {
    var doc = document;
    var screenX = typeof window.screenX != 'undefined' ? window.screenX : window.screenLeft,
        screenY = typeof window.screenY != 'undefined' ? window.screenY : window.screenTop,
        outerWidth = typeof window.outerWidth != 'undefined' ? window.outerWidth : document.body.clientWidth,
        outerHeight = typeof window.outerHeight != 'undefined' ? window.outerHeight : (document.body.clientHeight - 22),
        width = 800,
        height = 370,
        left = parseInt(screenX + ((outerWidth - width) / 2), 10),
        top = parseInt(screenY + ((outerHeight - height) / 2.5), 10),
        url = location.protocol+'//'+location.host+'/auth/vk';

    var win = window.open(url, 'vk_oauth', 'width='+width+',height='+height+',left='+left+',top='+top);

    var watch_timer = setInterval(function () {
      try {
        if (!win.location.href) {
          clearInterval(watch_timer);
          win.close();
        }

        var win_loc = win.location.href;

        if (win_loc.match(/biqle\.(ru|org)\/blank\.html/i)) {
          clearInterval(watch_timer);

          win.close();

          if (wm=win_loc.match(/biqle\.(ru|org)\/blank\.html\#(.*)/i)) {
            var vk_response = JSON.parse(decodeURIComponent(wm[1])) || {error: "JSON parse error"};

            if (vk_response && vk_response.error) {
              alert(vk_response.error_description ? vk_response.error_description : vk_response.error);
            } else {
              doc.location.reload();
            }
          }
        }
      } catch (e) {}
    }, 500);

    return false;
  };

  this.Facebook = function() {
    var doc = document;
    var screenX = typeof window.screenX != 'undefined' ? window.screenX : window.screenLeft,
        screenY = typeof window.screenY != 'undefined' ? window.screenY : window.screenTop,
        outerWidth = typeof window.outerWidth != 'undefined' ? window.outerWidth : document.body.clientWidth,
        outerHeight = typeof window.outerHeight != 'undefined' ? window.outerHeight : (document.body.clientHeight - 22),
        width = 650,
        height = 370,
        left = parseInt(screenX + ((outerWidth - width) / 2), 10),
        top = parseInt(screenY + ((outerHeight - height) / 2.5), 10),
        url = location.protocol+'//'+location.host+'/auth/facebook';

    var win = window.open(url, 'facebook_oauth', 'width='+width+',height='+height+',left='+left+',top='+top);

    var watch_timer = setInterval(function () {
      try {
        if (!win.location.href) {
          clearInterval(watch_timer);
          win.close();
        }

        if (win.location.href.match(/biqle\.(ru|org)\/blank\.html/i)) {
          clearInterval(watch_timer);

          if (win.location.href.match(/biqle\.(ru|org)\/blank\.html/i)) {
            doc.location.reload();
          }

          win.close();
        }
      } catch (e) {}
    }, 500);

    return false;
  };

  this.Google = function() {
    var doc = document;
    var screenX = typeof window.screenX != 'undefined' ? window.screenX : window.screenLeft,
        screenY = typeof window.screenY != 'undefined' ? window.screenY : window.screenTop,
        outerWidth = typeof window.outerWidth != 'undefined' ? window.outerWidth : document.body.clientWidth,
        outerHeight = typeof window.outerHeight != 'undefined' ? window.outerHeight : (document.body.clientHeight - 22),
        width = 650,
        height = 480,
        left = parseInt(screenX + ((outerWidth - width) / 2), 10),
        top = parseInt(screenY + ((outerHeight - height) / 2.5), 10),
        url = location.protocol+'//'+location.host+'/auth/google';

    var win = window.open(url, 'google_oauth', 'width='+width+',height='+height+',left='+left+',top='+top);

    var watch_timer = setInterval(function () {
      try {
        if (!win.location.href) {
          clearInterval(watch_timer);
          win.close();
        }

        if (win.location.href.match(/biqle\.(ru|org)\/blank\.html/i)) {
          clearInterval(watch_timer);

          if (win.location.href.match(/biqle\.(ru|org)\/blank\.html/i)) {
            doc.location.reload();
          }

          win.close();
        }
      } catch (e) {}
    }, 500);

    return false;
  };

  this.Twitter = function() {
    var doc = document;
    var screenX = typeof window.screenX != 'undefined' ? window.screenX : window.screenLeft,
        screenY = typeof window.screenY != 'undefined' ? window.screenY : window.screenTop,
        outerWidth = typeof window.outerWidth != 'undefined' ? window.outerWidth : document.body.clientWidth,
        outerHeight = typeof window.outerHeight != 'undefined' ? window.outerHeight : (document.body.clientHeight - 22),
        width = 650,
        height = 640,
        left = parseInt(screenX + ((outerWidth - width) / 2), 10),
        top = parseInt(screenY + ((outerHeight - height) / 2.5), 10),
        url = 'http://'+location.host+'/auth/twitter';

    var win = window.open(url, 'twitter_oauth', 'width='+width+',height='+height+',left='+left+',top='+top);

    var watch_timer = setInterval(function () {
      try {
        if (!win.location.href) {
          clearInterval(watch_timer);
          win.close();
        }

        if (win.location.href.match(/biqle\.(ru|org)\/blank\.html/i) || win.location.href.match(/api\.twitter\.com\/oauth\/authorize$/i)) {
          clearInterval(watch_timer);

          if (win.location.href.match(/biqle\.(ru|org)\/blank\.html/i)) {
            doc.location.reload();
          }

          win.close();
        }
      } catch (e) {}
    }, 500);

    return false;
  };

  this.Settings = function(self) {
    var check_new = $('#check_new').length, email = $('#settings_email'), pass1 = $('#settings_pass1'), pass2 = $('#settings_pass2');

    if (!isEmail(email.val().trim())) {
      email.focus();

      return false;
    }

    if (check_new) {
      if (!isPass(pass1.val().trim())) {
        pass1.focus();

        return false;
      }

      if (pass1.val().trim() !== pass2.val().trim()) {
        pass2.focus();

        return false;
      }
    } else {
      if ((pass1.val().trim()).length) {
        if (!isPass(pass1.val())) {
          pass1.focus();

          return false;
        }

        if (!isPass(pass2.val())) {
          pass2.focus();

          return false;
        }
      }
    }

    return true;
  };

  this.OnSettingsChange = function(response) {
    if (response.result) {
      $('#settings_message').addClass('success').removeClass('error').show().html(response.result);
    } else {
      $('#settings_message').addClass('error').removeClass('success').show().html(response.error);
    }
  };

  this.SwitchForm = function(to) {
    $('.main_form #error_message').hide();

    to = $('#' + to);
    to.parent().children('form').hide();
    to.show();
    to.find('input').eq(1).focus();
  };

  this.formSubmit = function(form) {
    $('.main_form .error_message').hide();

    switch (form.id) {
      case 'form_reg':
        var login = $(form).find('#reg_login'), email = $(form).find('#reg_email'), pass = $(form).find('#reg_pass');

        if (!(login.val()).match(/^[a-zA-Zа-яА-ЯёЁ0-9_\-\s]+$/i)) {
          login.focus();
          return false;
        }

        if (!isEmail(email.val())) {
          email.focus();
          return false;
        }

        if ((pass.val().trim()).length < 6) {
          pass.focus();
          return false;
        }

        $('#RegisterWrapper #error_message').hide().html('');
        $('#callback_frame').replaceWith('<iframe name="callback_frame" id="callback_frame" frameborder="0" style="display: none;"></iframe>');

        return true;
      break;

      case 'form_auth':
        var email = $(form).find('#login_email'), pass = $(form).find('#login_pass');

        if (!isEmail(email.val())) {
          email.focus();
          return false;
        }

        if ((pass.val().trim()).length < 6) {
          pass.focus();
          return false;
        }

        $('#LoginWrapper #error_message').hide().html('');
        $('#callback_frame').replaceWith('<iframe name="callback_frame" id="callback_frame" frameborder="0" style="display: none;"></iframe>');

        return true;
      break;

      case 'form_restore':
        var email = $(form).find('#restore_email');

        if (!isEmail(email.val())) {
          email.focus();
          return false;
        }

        $('#RestoreWrapper #error_message').hide().html('');
        $('#callback_frame').replaceWith('<iframe name="callback_frame" id="callback_frame" frameborder="0" style="display: none;"></iframe>');

        return true;
      break;
    }
  };
}

Auth = new Auth();
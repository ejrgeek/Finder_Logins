# Finder_Logins
Localiza paginas de logins em sites

require 'net/http'
banner = <<BANNER
                                  ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
                            ▄▄█▓███▓▓▓▒▓▓▒▓▒██████▄▄
                         ▄█▓▓▓█▓████████████▒█▒▒▒▒▓██▌
                      ▄▓▓▓█▓██▓▓█▀▀▀▀▀▀▀▀▀▀▓███▒▒▒▒██▌
                    █▓▓▓▓▓█▓▓▀                    ▀██▒▒▒▒██
                  ▄▓▓▓▓▓▓▓▀      ▄▄▄████████▄▄    ▀▀▓█▒▒▒▓█▌
                 █▓▓▓▓▓▓▀    ▄▄█████████████████▄    ▀▓█▒█▒██
                █▓▓▓▓▓▓     ███████████████████████▄    ▀▓███▓█
               █▓▓▓▓▓▓    ▄██████████████████████████▄   ▀▓███▓█
              ▐▓▓▓▓▓▓    ▄████████████████████████████▄   ▓▓██▓▓█
              █▓▓▓▓▓▓   ▐██████████████████████████████    ▓▓█▓▓▓
              ▓▓▓▓▓▓▌   ███████████████████████████████▌       ejr
              ▓▓▓▓▓▓▌   ███████████████████████████████▌         geek
              ▓▓▓▓▓▓█   ▐██████████████████████████████    ▄▄▄██▄
              ▐▓▓▓▓▓▓    █████████████████████████████▌   █▓█▓▓▓▓
               ▓▓▓▓▓▓▓    ███████████████████████████▀   ▄▓▓▓▓▓▓
                ▓▓▓▓▓▓▓    ▀████████████████████████▀   ▄▓▓▓▓▓▓▌
                 ▓▓▓▓▓▓▓▄    ▀███████████████████▀▀    █▓▓▓▓▓▓▀
                  ▓▓▓▓▓▓▓▓▄     ▀▀███████████▀▀▀     █▓▓▓▓▓▓▓▀
                    ▓▓▓▓▓▓▓▓█▄                   ▄█▓▓▓▓▓▓▓▓▀
                      ▓▓▓▓▓▓▓▓▓▓██▄▄▄▄▄▄▄▄▄▄█▓▓▓▓▓▓▓▓▓▓▀
                        ▀▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▀
                            ▀▀▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▀▀
                                ▀▀▀▀▀▓▓▓▓▓▓▀▀▀▀▀▀▀▀

BANNER
puts(banner)
num = 0

diretorios = ["/admin/","/administrator","administrator/index.asp","administrator/login.asp","administrator/account.asp",
              "administrator.asp","login.asp","/usuario","/moderator","/webadmin","/adminarea/","/bb-admin","/adminLogin","/admin_area",
              "/panel-administracion","/instadmin","/memberadmin","/administratorlogin","modelsearch/login.asp","moderator.asp",
              "moderator/login.asp","moderator/admin.asp","account.asp","controlpanel.asp","admincontrol.asp","adminpanel.asp",
              "fileadmin/","fileadmin.php","fileadmin.asp","fileadmin.html","administration/","administration.php",
              "administration.html","sysadmin.php","sysadmin.html","phpmyadmin/","myadmin/","sysadmin.asp",
              "sysadmin/","ur-admin.asp","ur-admin.php","ur-admin.html","ur-admin/","Server.php","Server.html",
              "Server.asp","Server/","/webadmin/","/sqlweb/","/websql/","/webdb/","/mysqladmin/","/mysql-admin/",
              "/private.php/","/robots.txt/","/photoalbum/upload/","/_vti_pvt/",":5800/","/phpMyAdmin/","/config.html/",
              "/_private/","admin1.php","admin1.html","admin2.php","admin2.html","yonetim.php","yonetim.html","yonetici.php",
              "yonetici.html","/Webmaster","/admin/Webmaster","/Webmaster/login","/adm","/admin/account.php","/admin/account.html",
              "/admin/index.php","/admin/index.html","/admin/login.php","/admin/login.html","/admin/home.php","/admin/controlpanel.html",
              "/admin/controlpanel.php","/admin.php","/admin.html","/admin/cp.php","/admin/cp.html","/cp.php","/cp.html","/administrator/",
              "/administrator/index.html","/administrator/index.php","/administrator/login.html","/administrator/login.php",
              "/administrator/account.html","/administrator/account.php","/administrator.php","/administrator.html","/login.php",
              "/login.html","/modelsearch/login.php","/moderator.php","/moderator.html","/moderator/login.php","/moderator/login.html",
              "/moderator/admin.php","/moderator/admin.html","/moderator/","/account.php","/account.html","/controlpanel/","/controlpanel.php",
              "/controlpanel.html","/admincontrol.php","/admincontrol.html","/adminpanel.php","/adminpanel.html","/admin1.asp","/admin2.asp",
              "/yonetim.asp","/yonetici.asp","/admin/account.asp","/admin/index.asp","/admin/login.asp","/admin/home.asp","/admin/controlpanel.asp",
              "/admin.asp","/admin/cp.asp","/cp.asp","/wp-admin/","/administr8.php","/administr8.html","/administr8/","/administr8.asp","/webadmin/",
              "/webadmin.php","/webadmin.asp","/webadmin.html","/administratie/","/admins/","/admins.php","/admins.asp","/administrivia/",
              "/Database_Administration/","/WebAdmin/","/useradmin/","/sysadmins/","/admin1/","/system-administration/","/administrators/","/pgadmin/",
              "/directadmin/","/staradmin/","/ServerAdministrator/","/SysAdmin/","/administer/","/LiveUser_Admin/","/sys-admin/","/typo3/","/panel/",
              "/cpanel/","/cPanel/","/cpanel_file/","/platz_login/","/rcLogin/","/blogindex/","/formslogin/","/autologin/","/support_login/","/meta_login/",
              "/manuallogin/","/simpleLogin/","/loginflat/","/utility_login/","/showlogin/","/memlogin/","/members/","/login-redirect/","/sub-login/","/wp-login/",
              "/login1/","/dir-login/","/login_db/","/xlogin/","/smblogin/","/customer_login/","/UserLogin/","/login-us/","/acct_login/","/admin_area/","/bigadmin/",
              "/project-admins/","/phppgadmin/","/pureadmin/","/sql-admin/","/radmind/","/openvpnadmin/","/wizmysqladmin/","/vadmind/","/ezsqliteadmin/","/hpwebjetadmin/",
              "/newsadmin/","/adminpro/","/Lotus_Domino_Admin/","/bbadmin/","/vmailadmin/","/Indy_admin/","/ccp14admin/","/irc-macadmin/","/banneradmin/","/sshadmin/",
              "/phpldapadmin/","/macadmin/","/administratoraccounts/","/admin4_account/","/admin4_colon/","/radmind-1/","/Super-Admin/","/AdminTools/","/cmsadmin/",
              "/SysAdmin2/","/globes_admin/","/cadmins/","/phpSQLiteAdmin/","/navSiteAdmin/","/server_admin_small/","/logo_sysadmin/","/server/","/database_administration/",
              "/power_user/","/system_administration/","/ss_vms_admin_sm/","/wp-login","/cpanel","/kpanel","/adm","/login","/admin/login"]

print("Digite o host > ")
site = gets.chomp

while num<=diretorios.length-1
  conectando = Net::HTTP.new(site)
  resultados , html = conectando.get(diretorios[num])
  if resultados.code == "200"
    print("Diretorio Encontrado #{diretorios[num]}\n")
    print("\nDeseja Continuar (s/n) ?")
    opt = gets.chomp
    if opt == "s"
      print("")
    else
      exit(0)
    end
  else
    print("Diretorio não Encontrado #{diretorios[num]}\n")
  end

  num+=1

end

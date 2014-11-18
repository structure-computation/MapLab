


#clear page
MAIN_DIV = document.body
USER_EMAIL = ""
APPS = new Lst

clear_page = ->
    while MAIN_DIV.firstChild?
        MAIN_DIV.removeChild MAIN_DIV.firstChild

    
load_if_cookie_lab = () ->
    if $.cookie("email") and $.cookie("password")
        email = $.cookie("email")
        password = $.cookie("password")
        USER_EMAIL = email
        
        xhr_object = FileSystem._my_xml_http_request()
        xhr_object.open 'GET', "get_user_id?u=#{encodeURI email}&p=#{encodeURI password}", true
        xhr_object.onreadystatechange = ->
            if @readyState == 4 and @status == 200
                lst = @responseText.split " "
                user_id = parseInt lst[ 0 ]
                if user_id > 0
                    launch_lab user_id, decodeURIComponent lst[ 1 ].trim()
                else
                     window.location = "login.html"     
                    
                
        xhr_object.send()
          
    else   
        window.location = "login.html"       
    

#main program
launch_lab = ( userid, home_dir, main = document.body ) ->
    FileSystem._home_dir = home_dir
    FileSystem._userid   = userid
    MAIN_DIV = main
       
    
    #lab
    bs = new BrowserState
    fs = new FileSystem
    
    bs.location.bind ->
        clear_page()

        
        #login bar
        config_dir = FileSystem._home_dir + "/__config__" 
        fs.load_or_make_dir config_dir, ( current_dir, err ) ->
            config_file = current_dir.detect ( x ) -> x.name.get() == ".config"
            config_file.load ( config, err ) =>
                login_bar = new LoginBar main, config

        hash = bs.location.hash.get()
        # something to reload ?
        if hash.length > 1
            path = decodeURIComponent hash.slice 1
            fs.load path, ( td, err ) ->
                if err
                    window.location = "#"
                else
                    app = new MapTreeApp main, td
                        
                
        # else, return to desk
        else
            window.location = "desk.html"
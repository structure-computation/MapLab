
#clear page
MAIN_DIV = document.body
USER_EMAIL = ""
APPS = new Lst


#inclusion dans une nouvelle session        
include_session = (td) ->    
      

#type de nouvelle session
new_session = ->
    td = new DemoTreeAppData
    td.new_session()
    include_session td
    td



#main program
launch_softdemo = ( main = document.body ) ->
    
    FileSystem._userid   = "168"
    MAIN_DIV = main
    
    #recupération de l'application de demo
    bs = new BrowserState
    hash = bs.location.hash.get()
    
    reg=new RegExp("[#]+", "g")
    table = hash.split(reg)

    console.log table.length
    console.log table
    console.log table[1]
    console.log table[2]
    
#     for name in table
#         console.log name
    
    if table.length == 2
        ApplicationItem = decodeURIComponent table[1]
        console.log ApplicationItem 
        
    else if table.length == 3
        ApplicationItem = decodeURIComponent table[1]
        console.log ApplicationItem 
        
        ArchiveNumber = decodeURIComponent table[2]
        console.log ArchiveNumber 
    else 
        alert "erreur"
    
    eval "var demo_application = new #{ ApplicationItem };"
    this_demo_app = demo_application

    #usefull apps for the demo
    APPS = this_demo_app.associated_application()
    FileSystem._home_dir = "__archives__/" + this_demo_app.directory.get()
    

    #initiate lab data
    fs = new FileSystem
    
    if not ArchiveNumber?
        new_demo_session = new_session()
        new_archive = ""
        fs.load_or_make_dir FileSystem._home_dir, ( current_dir, err ) ->
            nd = new Directory
            new_archive = current_dir.force_add_file this_demo_app.demo_app.get(), nd
        
            dir =  "__archives__/#{this_demo_app.directory.get()}/#{new_archive.name.get()}" 
            FileSystem._home_dir = dir
            console.log dir
            
            fs.load_or_make_dir dir, ( actual_dir, err ) -> 
                actual_dir.add_file "Session", new_demo_session, model_type: "Session", icon: "session"
                current_session = fs.load "#{dir}/Session", ( td, err ) ->
    #                 td = new_demo_session
                        
                    td.modules.push new TreeAppModule_UndoManager
                    td.modules.push new TreeAppModule_PanelManager
                    td.modules.push new TreeAppModule_File
                        name : "Demo files"
                        home_dir : "__demos__/" + this_demo_app.directory.get()
                        use_icons   : false
                        use_upload  : false
                        use_manage  : false
                    td.modules.push new TreeAppModule_File
                        name : "Test with my files"
                        home_dir : dir
                        use_icons   : false
                        use_upload  : true
                    td.modules.push new TreeAppModule_Apps false
                    #td.modules.push new TreeAppModule_Projects   
                    
                    td.modules.push new TreeAppModule_Animation
                    td.modules.push new TreeAppModule_TreeView  
                    
                    
                    #initiate lab session
                    this_demo_app.run_demo td
                    
                    #save the demo in the archive
                    
                    
                    #lab
                    app = new TreeApp main, td, false
                    
    else 
        dir =  "__archives__/#{this_demo_app.directory.get()}/#{this_demo_app.demo_app.get()}_#{ArchiveNumber}" 
        FileSystem._home_dir = dir
        console.log dir
        current_session = fs.load "#{dir}/Session", ( td, err ) ->
            app = new TreeApp main, td, false
        
            
                
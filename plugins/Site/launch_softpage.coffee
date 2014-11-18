

#clear page
MAIN_DIV = document.body
USER_EMAIL = ""
APPS = new Lst

#inclusion dans une nouvelle session        
include_demo_session = (soft_demo_data) ->    
#     soft_demo_data.applications.push new TreeAppApplication_CRM
#     soft_demo_data.applications.push new TreeAppApplication_Annotation
#     soft_demo_data.applications.push new TreeAppApplication_Test
        

#launch softhub page ------------------------------------------------------------------------------------------------------------    
launch_softpage = ( main = document.body ) ->
    MAIN_DIV = main
    main.style.overflowY = "auto"
    main.style.overflowX = "auto"
    bs = new BrowserState
    hash = bs.location.hash.get()
    if hash.length > 1
        path = decodeURIComponent hash.slice 1
        console.log path
        
    else 
        alert "erreur"
    
    soft_demo_data = new IssimSoftPageData
        name        : "is-sim Demo"
        project_name: "is-sim Demo"
        demo_application: path
    
    softdemo_view = new SoftHubView main, soft_demo_data

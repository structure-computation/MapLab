

#clear page
MAIN_DIV = document.body
USER_EMAIL = ""
APPS = new Lst

#inclusion dans une nouvelle session        
include_session = (soft_hub_data) ->    
#     soft_hub_data.applications.push new TreeAppApplication_CRM
#     soft_hub_data.applications.push new TreeAppApplication_Annotation
#     soft_hub_data.applications.push new TreeAppApplication_Test
        

#type de nouvelle session
new_session = ->
    soft_hub_data = new IssimSoftHubData
        name        : "is-sim"
        project_name: "is-sim"
          
    include_session soft_hub_data
    soft_hub_data

#launch softhub page ------------------------------------------------------------------------------------------------------------    
launch_softhub = ( main = document.body ) ->
    MAIN_DIV = main
    main.style.overflowY = "auto"
    main.style.overflowX = "auto"
    
    soft_hub_data = new_session()
    softhub_view = new SoftHubView main, soft_hub_data

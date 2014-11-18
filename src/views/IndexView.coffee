# Copyright 2012 Structure Computation  www.structure-computation.com
# Copyright 2014 jeremie Bellec
#
# This file is part of Soda.
#
# Soda is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Soda is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with Soda. If not, see <http://www.gnu.org/licenses/>.



#
class IndexView extends View
    constructor: ( @el ) ->
        @page_container = new_dom_element
            nodeName  : "div"
            parentNode: @el
              
        @container_bakground = new_dom_element
            parentNode : @page_container
            nodeName   : "div" 
            className  : "indexBackground"    
        
        #valeur par defaut
#         @backgroundColor = 
#             first : "#262626"
#             second : "#f6f6f6"
#             separator : "#e6e6e6"
#             highlight : "#4dbce9"
#             
#         @textColor = 
#             first : "#f6f6f6"
#             second : "#262626"
#             highlight : "#4dbce9"
#             
#         @lineColor = 
#             first : "1px solid #f6f6f6 "
#             second : "1px solid #262626 "
#             highlight : "1px solid #4dbce9 "
        
        
        #valeur test
        @backgroundColor = 
            first : "#262626"
            second : "#f6f6f6"
            separator : "#e6e6e6"
            highlight : "#4dbce9"
            
        @textColor = 
            first : "#f6f6f6"
            second : "#262626"
            highlight : "#4dbce9"
            
        @lineColor = 
            first : "1px solid #f6f6f6 "
            second : "1px solid #262626 "
            highlight : "1px solid #4dbce9 "
        
        @create_index()
        

        
        
    
    clear_page: ->
        while @container_bakground.firstChild?
            @container_bakground.removeChild @container_bakground.firstChild
    
    add_part_separator: ->
        part = new_dom_element
            parentNode : @container_bakground
            nodeName   : "div" 
            className  : "indexpart"
            style :
                height : 200
                background : @backgroundColor.separator
    
    add_part: ( name, background = "", color = "", fixed = "" ) ->
        part = new_dom_element
            parentNode : @container_bakground
            nodeName   : "div" 
            className  : "indexpart"
            
        if background != ""
            part.style.background = background
            part.style.color = color
        
        if fixed != ""
            part.style.position = "fixed"
            part.style.top      = 0
            part.style.width    = "100%"
                
        center_part = new_dom_element
            parentNode : part
            nodeName   : "div" 
            id         : name
            className  : "indexcenterpart"
            
        return center_part
            
    add_col : ( subdivision, parent ) ->  
        nb_sub = Math.floor(100/subdivision)
        col = new_dom_element
            parentNode : parent
            nodeName   : "div" 
            style :
                width   : nb_sub + "%"
                cssFloat   : "left"
                textAlign : "center"
                margin: "0 0 20px 0"
                
        return col
    
    
    create_menu: ->
        menu = @add_part "menu", @backgroundColor.first, @textColor.first, "fixed"
        
        menu_logo = new_dom_element
            parentNode : menu
            nodeName   : "div" 
            className  : "indexlogo"
            
        menu_presentation = new_dom_element
            parentNode : menu
            nodeName   : "div" 
            className  : "indexMenuButton"
            txt        : "Presentation"
            onclick: ( evt ) ->
                $(document.body).animate
                    scrollTop:   $('#presentation').offset().top - 80
                    1500
#             onclick: ( evt ) ->
#                 $('#presentation').animate
#                     width: '+20px'
#                     opacity: '0.5'
#                     2000
                             
        menu_team = new_dom_element
            parentNode : menu
            nodeName   : "div" 
            className  : "indexMenuButton"
            txt        : "Company"
            onclick: ( evt ) ->
                $(document.body).animate
                    scrollTop:   $('#team').offset().top - 80
                    1500

        menu_product = new_dom_element
            parentNode : menu
            nodeName   : "div" 
            className  : "indexMenuButton"
            txt        : "Solution"
            onclick: ( evt ) ->
                $(document.body).animate
                    scrollTop:   $('#solution').offset().top - 80
                    1500
        
#         menu_product = new_dom_element
#             parentNode : menu
#             nodeName   : "div" 
#             className  : "indexMenuButton"
#             txt        : "Products"
#             onclick: ( evt ) ->
#                 $(document.body).animate
#                     scrollTop:   $('#products').offset().top - 80
#                     1500
#             
        menu_offer = new_dom_element
            parentNode : menu
            nodeName   : "div" 
            className  : "indexMenuButton"
            txt        : "Services"
            onclick: ( evt ) ->
                $(document.body).animate
                    scrollTop:   $('#services').offset().top - 80
                    1500
            
        menu_contact = new_dom_element
            parentNode : menu
            nodeName   : "div" 
            className  : "indexMenuButton"
            txt        : "Contact"
            onclick: ( evt ) ->
                $(document.body).animate
                    scrollTop:   $('#contact').offset().top - 80
                    1500
            
        menu_login = new_dom_element
            parentNode : menu
            nodeName   : "div" 
            className  : "indexMenuButton"
            txt        : "is-sim beta ->"
            style : 
                cssFloat : "right"
                color : @textColor.highlight
                fontWeight : "bold"
                fontSize   : "23px"
                fontFamily: "'Indie Flower', sans-serif"
            onclick: ( evt ) ->
                window.location = "login.html" 
            
            
        top = @add_part "top"
        top_size =  new_dom_element
            parentNode : top
            nodeName   : "div" 
            style      :
                height     : "30px"
 
    #presentation-----------------------------------------------------------------------
    create_presentation: ->
        presentation = @add_part "presentation", @backgroundColor.second, @textColor.second 
        presentation_title =  new_dom_element
            parentNode : presentation
            nodeName   : "div" 
            txt        : "is-sim" 
            className  : "indexcenterpartTitle"
        
        presentation_video =  new_dom_element
            parentNode : presentation
            nodeName   : "div" 
            txt        : '<iframe width="853" height="480" src="//www.youtube.com/embed/K1MVV_nG8BI?rel=0" frameborder="0" allowfullscreen></iframe>'  
            style      :
                margin     : "0px 0 0 123px"
                cssFloat      : "left"
        
        presentation_title =  new_dom_element
            parentNode : presentation
            nodeName   : "div" 
            txt        : "Try is-sim beta now ->"  
            style      :
                width      : "100%"
                height     : 40
                border     : "none"
                fontSize   : "35px"
                fontWeight : "bold"
                margin  : "20px 0 10px 0"
                textAlign  : "center"
                fontFamily : "'Indie Flower', sans-serif"
                cssFloat      : "left"
                cursor : "pointer"
                color : @textColor.highlight
                
            onclick: ( evt ) ->
                window.location = "login.html" 
        
         
        #key idea ---------------------------------------        
        key_idea = @add_part "key_idea", @backgroundColor.first, @textColor.first

        col1 = @add_col(3, key_idea)
        new_dom_element
            parentNode : col1
            nodeName   : "div" 
            txt        : 'CONNECT'  
            className  : "presentationBigTitleCol"
        new_dom_element
            parentNode : col1
            nodeName   : "div" 
            txt        : 'Access & use all your data and applications everywhere through your web browser. This is simple !'  
            className  : "presentationIndiTextCol"

        col2 = @add_col(3, key_idea)
        new_dom_element
            parentNode : col2
            nodeName   : "div" 
            txt        : 'COLLABORATE'  
            className  : "presentationBigTitleCol"
        new_dom_element
            parentNode : col2
            nodeName   : "div" 
            txt        : 'Share and modify all your data (text, project, 3D...) in real time !'  
            className  : "presentationIndiTextCol"   
            
        col3 = @add_col(3, key_idea)
        new_dom_element
            parentNode : col3
            nodeName   : "div" 
            txt        : 'COMPUTE'  
            className  : "presentationBigTitleCol"
        new_dom_element
            parentNode : col3
            nodeName   : "div" 
            txt        : 'Use remote powerful resources ond demand. Fit them to your needs !'  
            className  : "presentationIndiTextCol"
        
        biglogo = @add_col(1, key_idea)
        new_dom_element
            parentNode : biglogo
            nodeName  : "img"
            src       : "img/biglogo.png"
            alt       : "logo"
            title     : "logo"
            style      :
                margin: "0 0 20px 0"    
            
    #company -----------------------------------------------------------------------------        
    create_team: ->
        team = @add_part "team", @backgroundColor.second, @textColor.second 
        team_title =  new_dom_element
            parentNode : team
            nodeName   : "div" 
            txt        : 'Team' 
            className  : "indexcenterpartTitle"
        
        team1 = @add_col(2, team)
        new_dom_element
            parentNode : team1
            nodeName  : "img"
            src       : "img/team.png"
            alt       : "Jérémie Bellec"
            title     : "Jérémie Bellec"
        new_dom_element
            parentNode : team1
            nodeName   : "div"
            txt        : 'Jeremie Bellec : <br> CEO, PhD in mechanical engineering'  
            style      :
                width      : "100%"

        team2 = @add_col(2, team)
        new_dom_element
            parentNode : team2
            nodeName  : "img"
            src       : "img/team.png"
            alt       : "Hugo Leclerc"
            title     : "Hugo Leclerc"
        new_dom_element
            parentNode : team2
            nodeName   : "div"
            txt        : 'Hugo Leclerc : <br> Scientific advisor, PhD, CNRS'  
            style      :
                width      : "100%"
        
        team3 = @add_col(3, team)
        new_dom_element
            parentNode : team3
            nodeName  : "img"
            src       : "img/team.png"
            alt       : "Raphael Bellec"
            title     : "Raphael Bellec"
        new_dom_element
            parentNode : team3
            nodeName   : "div"
            txt        : 'Raphael Bellec : <br> Associate, web entrepreneur'  
            style      :
                width      : "100%"
        
        
        team4 = @add_col(3, team)
        new_dom_element
            parentNode : team4
            nodeName  : "img"
            src       : "img/team.png"
            alt       : "David Violeau"
            title     : "David Violeau"
        new_dom_element
            parentNode : team4
            nodeName   : "div"
            txt        : 'David Violeau : <br> Associate, PhD, professor'  
            style      :
                width      : "100%"
                
        team5 = @add_col(3, team)
        new_dom_element
            parentNode : team5
            nodeName  : "img"
            src       : "img/team.png"
            alt       : "Alain Caignot"
            title     : "Alain Caignot"
        new_dom_element
            parentNode : team5
            nodeName   : "div"
            txt        : 'Alain Caignot : <br> Associate, PhD, professor'  
            style      :
                width      : "100%"
        
        #goal----------------------------------------------------------------------
        goal = @add_part "objectif", @backgroundColor.second, @textColor.second 
        goal_title =  new_dom_element
            parentNode : goal
            nodeName   : "div" 
            txt        : 'Goals' 
            className  : "indexcenterpartTitle"
        new_dom_element
            parentNode : goal
            nodeName   : "div" 
            txt        : "<b>is-sim</b> was founded on the basis of several observations: <ul type='circle'>
                              <li> cost of simulation tools (software, hardware, maintenance) is too high</li>
                              <li> simulation solutions are inaccessible to a large number of small companies</li>
                              <li> new HPC needs lead to a demand for new and more flexible usages</li>
                              <li> digital data generated are more complex and numerous</li>
                              <li> these data must be exchanged, shared, interpreted by several teams</li>
                              <li> many specialised computing solutions are not available, they remain confined in laboratories or specialized companies</li>
                              <li> ... </li>
                          </ul>
                          <br> Our goals are ambitious: solve all of these problems with an efficient, simple and affordable solution !
                          <br> 
                          <br> For this end, we have designed <b>is-sim</b>  platform, accessible in SaaS mode and open to third party solutions. Best simulation applications will soon be available on demand, in a unified environment managing simulation data and interoperability between applications.
                          <br> 
                          <br> <b>is-sim</b> , the result of 6 years of development around the latest web and HPC technologies will revolutionize design projects based on simulation."  
            style      :
                textAlign  : "justify"
        

        #awards ---------------------------------------------------------
        awards = @add_part "awards", @backgroundColor.second, @textColor.second   
        awards_title =  new_dom_element
            parentNode : awards
            nodeName   : "div" 
            txt        : 'Awards' 
            className  : "indexcenterpartTitle"
        
        cola1 = @add_col(2, awards)
        new_dom_element
            parentNode : cola1
            nodeName   : "div" 
            txt        : 'Innovative technologies <br> (French ministery of research, BPI France)' 
        new_dom_element
            parentNode : cola1
            nodeName  : "img"
            src       : "img/CCETI_oseo.png"
            width     : "150"
        
        
        cola2 = @add_col(2, awards)
        new_dom_element
            parentNode : cola2
            nodeName   : "div" 
            txt        : 'Innovative SME <br> (system@tic cluster)' 
        new_dom_element
            parentNode : cola2
            nodeName  : "img"
            src       : "img/logo_PME_innvante_systematic.png"
            width     : "250"
        
        #partners ---------------------------------------------------------
        partners = @add_part "partners", @backgroundColor.second, @textColor.second   
        partners_title =  new_dom_element
            parentNode : partners
            nodeName   : "div" 
            txt        : 'Partners' 
            className  : "indexcenterpartTitle"
        
        col1 = @add_col(3, partners)
        new_dom_element
            parentNode : col1
            nodeName  : "img"
            src       : "img/logo_ministere.jpg"
            width     : "200"
        
        col2 = @add_col(3, partners)
        new_dom_element
            parentNode : col2
            nodeName  : "img"
            src       : "img/logo_BPI_France.png"
            width     : "200"
            style      :
                margin : "0px 0 30px 0"
            
        new_dom_element
            parentNode : col2
            nodeName  : "img"
            src       : "img/logo_ESSONE.png"
            width     : "200"
        
        col3 = @add_col(3, partners)
        new_dom_element
            parentNode : col3
            nodeName  : "img"
            src       : "img/logo_ens.png"
            width     : "200"
            style      :
                margin : "0px 0 30px 0"
        
        new_dom_element
            parentNode : col3
            nodeName  : "img"
            src       : "img/logo_incuballiance.png"
            width     : "200"    
        
    
    #contact--------------------------------------------
    create_contact: ->
        contact = @add_part "contact", @backgroundColor.second, @textColor.second  
        contact.style.textAlign = "center"
        contact_title =  new_dom_element
            parentNode : contact
            nodeName   : "div" 
            txt        : 'Contact' 
            className  : "indexcenterpartTitle"
        new_dom_element
            parentNode : contact
            nodeName   : "div"
            txt        : "86 rue de Paris, 91400 Orsay, FRANCE"
            style      :
                width      : "100%"
                textAlign : "center"
                margin : "20px 0 5px 0"
        new_dom_element
            parentNode : contact
            nodeName   : "a"
            href       : "mailto:contact@structure-computation.com"
            txt        : "send a mail"
            style      :
                width     : "100%"
                textAlign : "center"
        new_dom_element
            parentNode : contact
            nodeName   : "div"
            txt        : '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2633.484965886882!2d2.1946309000000097!3d48.696210899999976!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e5d61facc30587%3A0xccaaa136fb1452e7!2s86+Rue+de+Paris!5e0!3m2!1sfr!2sfr!4v1404916614372" width="900" height="450" frameborder="0" style="border:0"></iframe>'
            style      :
                width      : "100%"
                margin     : "20px 0 0 0"

    #Solution--------------------------------------------
    create_solution: ->
        presentation = @add_part "solution", @backgroundColor.second, @textColor.second   
        solution.style.textAlign = "center"
        contact_title =  new_dom_element
            parentNode : solution
            nodeName   : "div" 
            txt        : 'Solution' 
            className  : "indexcenterpartTitle"
            
        #key idea ---------------------------------------        
        col1 = @add_col(3, presentation)
        new_dom_element
            parentNode : col1
            nodeName   : "div" 
            txt        : 'CONNECT'  
            className  : "presentationBigTitleCol"
        new_dom_element
            parentNode : col1
            nodeName  : "img"
            src       : "img/solution_select.jpg"
            alt       : "Select"
            title     : "Select"
        new_dom_element
            parentNode : col1
            nodeName   : "div" 
            txt        : 'ONLINE DESIGN  <br> APPLICATIONS LIBRARY !'  
            className  : "presentationTitleCol"
        new_dom_element
            parentNode : col1
            nodeName   : "div" 
            txt        : 'Third party design applications <br>  All options available  <br>  Full web unified environment'  
            className  : "presentationTextCol"
        
        
        col2 = @add_col(3, presentation) 
        new_dom_element
            parentNode : col2
            nodeName   : "div" 
            txt        : 'COLLABORATE'  
            className  : "presentationBigTitleCol"
        new_dom_element
            parentNode : col2
            nodeName  : "img"
            src       : "img/solution_share.jpg"
            alt       : "Share"
            title     : "Share"
        new_dom_element
            parentNode : col2
            nodeName   : "div" 
            txt        : 'COLLABORATE <br> IN REAL TIME !'  
            className  : "presentationTitleCol"
        new_dom_element
            parentNode : col2
            nodeName   : "div" 
            txt        : 'Collaborate on all your data in real time <br> Share immediately all your results <br> Full compatibility between applications'  
            className  : "presentationTextCol"
        
        col3 = @add_col(3, presentation)
        new_dom_element
            parentNode : col3
            nodeName   : "div" 
            txt        : 'COMPUTE'  
            className  : "presentationBigTitleCol"
        new_dom_element
            parentNode : col3
            nodeName  : "img"
            src       : "img/solution_simulate.jpg"
            alt       : "Simulate"
            title     : "Simulate"
        new_dom_element
            parentNode : col3
            nodeName   : "div" 
            txt        : 'POWERFUL <br> AND SIMPLE !'  
            className  : "presentationTitleCol"
        new_dom_element
            parentNode : col3
            nodeName   : "div" 
            txt        : 'Use tremendous HPC resources <br> On demand Simulation <br> Fluid data visualisation with WebGL'  
            className  : "presentationTextCol"   
            
            
        
        
        #description ---------------------------------------   
        description = @add_part "description", @backgroundColor.first, @textColor.first   
        description.style.textAlign = "center"
        new_dom_element
            parentNode : description
            nodeName   : "div" 
            txt        : "<b> is-sim </b> is a real time collaborative solution for design applications. This web-based operating system offers powerfull tools to any user needing to realise design simulations and to any editors needing SaaS version of their software. <b> is-sim </b> provide, in a unified environment, the best third party tools, standard software as well as High Performance Computing software. All these tools are served by a unified and dynamic web interface and a unified data format. Associated with the power of cloud computing and centralization of computing means, software licenses and data, <b>is-sim</b> is to become the first and most powerful collaborative SaaS solution."  
            style      :
                textAlign  : "justify"
                
        biglogo = @add_col(1, description)
        new_dom_element
            parentNode : biglogo
            nodeName  : "img"
            src       : "img/biglogo.png"
            alt       : "logo"
            title     : "logo"
            style      :
                margin: "0 0 20px 0"
                
        ill1 = @add_col(4, description)
        new_dom_element
            parentNode : ill1
            nodeName  : "img"
            src       : "img/Correli.png"
            alt       : "Correli"
            title     : "Correli"
            
        ill2 = @add_col(4, description)
        new_dom_element
            parentNode : ill2
            nodeName  : "img"
            src       : "img/Mesh.png"
            alt       : "Mesh"
            title     : "Mesh"
            
        ill3 = @add_col(4, description)
        new_dom_element
            parentNode : ill3
            nodeName  : "img"
            src       : "img/Scills.png"
            alt       : "Scills"
            title     : "Scills"
            
        ill4 = @add_col(4, description)
        new_dom_element
            parentNode : ill4
            nodeName  : "img"
            src       : "img/Plot.png"
            alt       : "Plot"
            title     : "Plot"
    
    #Products--------------------------------------------
    create_products: ->
        products = @add_part "products", @backgroundColor.second, @textColor.second 
        products.style.textAlign = "center"
        contact_title =  new_dom_element
            parentNode : products
            nodeName   : "div" 
            txt        : 'Products' 
            className  : "indexcenterpartTitle"
            
    #Services--------------------------------------------
    add_service: (parent, short_service, recipient, description) ->
        service_editor = new_dom_element
            parentNode : parent
            nodeName   : "div" 
            style      :
                cssFloat   : "left" 
                margin     : "10px 0px 10px 0"
        short = new_dom_element
            parentNode : service_editor
            nodeName   : "div"  
            style      :
                width      : "200px"
                height     : "220px"
                textAlign  : "center"
                fontWeight : "bold"
                fontSize   : "25px"
                color      : @textColor.first
                margin     : "0px 30px 0px 0"
                background : @backgroundColor.highlight
                cssFloat   : "left"
                
        new_dom_element
            parentNode : short
            nodeName   : "div"  
            txt        : short_service
            style      :  
                width   : "200px"
                margin     : "50px 0px 0px 0"
#                 border     : "1px solid grey"
                
            
        new_dom_element
            parentNode : service_editor
            nodeName   : "div" 
            txt        : recipient
            style      :
                width      : "800px"
                height     : "30px"
                textAlign  : "left"
                fontWeight : "bold"
                fontSize   : "23px"
                margin     : "0px 0px 0px 0"
                cssFloat   : "left"             
        new_dom_element
            parentNode : service_editor
            nodeName   : "div" 
            txt        : description
            style      :
                width      : "850px"
                textAlign  : "left"
                margin     : "0px 0px 0px 0"
                cssFloat   : "left"
    
    create_services: ->
        services = @add_part "services", @backgroundColor.second, @textColor.second 
        services.style.textAlign = "center"
        contact_title =  new_dom_element
            parentNode : services
            nodeName   : "div" 
            txt        : 'Services' 
            className  : "indexcenterpartTitle"
        
        @add_service( 
            services
            "SaaS <br> enabler & provider",
            "FOR SOFTWARE EDITORS",
            "<b> How to commercialize my software worldwide with a small sales force ? </b> <br>
                SaaS distribution is the key way to increase your sales potential without massive investments. 
                <b> is-sim </b> team assists you in this transition, first by providing an online demo of your software accessible from your website  
                then gradually integrating all the functions into a full online version and building your new business model. <br>
                Whether your software is simple or highly technical, <b> is-sim </b> hybrid SaaS solution fits to your needs and gives new collaborative abilities to your software." )
            
        @add_service( 
            services
            "Recurring <br> business <br> model",
            "FOR OPEN SOURCE SOFTWARE EDITORS",
            "<b> How to secure my business with recurring income ? </b> <br>
                The direct answer is: by selling a quality service that simplifies the lives of your clients and that is recurrent...<br>
                <b> is-sim </b> team invites you to make your software available in SaaS mode and thus offer a large number of your users 
                the ability to simply use your applications without installation or maintenance constraints, equipment purchase...
                You give new collaborative abilities to your software and secure your business with recurring income." )
        
        @add_service( 
            services
            "Online Applicative journal",
            "FOR RESEARCH LABORATORIES",
            "<b> How to improve visibility of my research and sustain my algorithm development ? </b> <br>
                You can now use your algorithms as a communication medium of your research. With <b> is-sim </b> you associate 
                with each of your articles an online demonstrator of the algorithm which implements the method described. 
                You make your research reproducible, sustainable and give it a more practical aspect. Your works are understandable 
                by a greater number of people who can bring you new research contracts." )
        
        @add_service( 
            services
            "Maturation <br> of research algorithms",
            "FOR OFFICES OF TECHNOLOGY TRANSFERT",
            "<b> How to accelerate the maturation of my research software ? </b> <br>
                We designed around <b> is-sim </b> a new organization covering the essential stages of maturation : <ul type='circle'>
                <li>  <b> Legal maturation : </b> we propose a standard model for sharing of IP on the global solution.  </li>
                <li>  <b> Technical maturation : </b> the association with <b> is-sim </b> makes your software compatible with all other inegrated softwares and gives it a standardized ergonomic GUI already known by users. </li>
                <li>  <b> Commercial maturation : </b>  your software is now available anywhere in the world. Early adopters can directly play with it and participate to its evolution. </li>
                </ul>" )
        
#         @add_service( 
#             services
#             "Your collaborative environment",
#             "FOR MANAGER OF COLLABORATIVE PROGRAM",
#             "Your description here" )
            
    
    #bottom of the page--------------------------------------------
    create_bottom: ->
        bottom = @add_part "bottom", @backgroundColor.first, @textColor.first
        bottom_part =  new_dom_element
            parentNode : bottom
            nodeName   : "div" 
            style      :
                width      : "100%"
                height     : "300px"
                textAlign  : "center"
        
        bottom_cont =  new_dom_element
            parentNode : bottom_part
            nodeName   : "div" 
            txt        : "Designed and built by <b> is-sim </b> team. "
            style      :
                cssFloat   : "left"
                textAlign  : "left"
                padding : "0 10px 0 0"
                borderRight : @lineColor.first
                
        new_dom_element
            parentNode : bottom_part
            nodeName   : "div" 
            txt        : "&copy; Structure Computation 2014 "
            style      :
                cssFloat   : "left"
                textAlign  : "left"
                borderRight : @lineColor.first
                padding : "0 10px 0 10px"
                
        new_dom_element
            parentNode : bottom_part
            nodeName   : "div" 
            txt        : "<b> is-sim </b> is a trademark of Structure Computation "
            style      :
                cssFloat   : "left"
                textAlign  : "left"
                padding : "0 10px 0 10px"
                
        new_dom_element
            parentNode : bottom_part
            nodeName   : "img" 
            src        : "img/Logo_StructureComputation_gris.png"
            style      :
                cssFloat   : "right"
                textAlign  : "left"
    
    # index  ---------------------------------------------------------------------------------------------   
    create_index: ->
        @clear_page()
        
        #menu----------------------------------------------------------
        @create_menu()
        
        #presentation----------------------------------------------------------   
        @create_presentation()
        
        #team----------------------------------------------------------
        @add_part_separator()
        @create_team()
        
        #Solution----------------------------------------------------------
        @add_part_separator()
        @create_solution()
        
#         #Products----------------------------------------------------------
#         @add_part_separator()
#         @create_products()
       
        #Services----------------------------------------------------------
        @add_part_separator()
        @create_services()
        
        #contact----------------------------------------------------------
        @add_part_separator()
        @create_contact()

        #page bottom----------------------------------------------------------
        @create_bottom()
        
        
        
       
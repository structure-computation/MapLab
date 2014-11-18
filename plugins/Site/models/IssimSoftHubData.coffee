# Copyright 2012 Structure Computation  www.structure-computation.com
# Copyright 2012 Hugo Leclerc
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
class IssimSoftHubData extends TreeItem
    constructor: ( params = {}) ->
        super()

        @_name._set if params.name? then params.name else "Name" 
            
        @add_attr
            # tree
            project_name : if params.project_name? then params.project_name else "Project name"
            balise_logo : '#presentation'
            backgroundColor :
                first : "#262626"
                second : "#f6f6f6"
                separator : "#e6e6e6"
                highlight : "#4dbce9"
                specific : "transparent url( 'img/MoucetiBackgroud.png' ) center top repeat"
                
            textColor :
                first : "#f6f6f6"
                second : "#262626"
                highlight : "#4dbce9"
                
            lineColor :
                first : "1px solid #f6f6f6 "
                second : "1px solid #262626 "
                highlight : "1px solid #4dbce9 "
            
        
        @run_test_2()
    

    add_menu_item: () ->
        menu = new SitePartItem 
                name : 'menu'
                type : 'menu'
        @add_child menu
        
        #ajout de bouton au menu------------------------------------------------------------------------------------
        logo = new MenuLogoItem "img/logo_issim_test.png", '#presentation'
        
        bm0 = new MenuButtonItem "Presentation", '#presentation' 
        bm1 = new MenuButtonItem "Services", '#services'
        bm2 = new MenuButtonItem "Solution", '#solution'
        bm3 = new MenuButtonItem "Softhub", '#softhub'
        bm4 = new MenuButtonItem "Company", '#company' 
        bm5 = new MenuButtonItem "Contact", "#contact"
        
        link = new MenuButtonItem "Try is-sim ->" , '#softhub'
        link.cssFloat = "right"
        link.color = @textColor.highlight
        link.fontFamily = "'Indie Flower', sans-serif"
        link.fontSize = "23px"
        
        menu.add_child logo
        menu.add_child bm0
        menu.add_child bm1
        menu.add_child bm2
        menu.add_child bm3
        menu.add_child bm4
        menu.add_child bm5
        menu.add_child link
        
    add_presentation_item: () ->
        #ajout de la presentation---------------
        presentation = new SitePartItem 
                name : 'is-sim'
                balise : 'presentation'
                title : false
                separator  : false
                background : @backgroundColor.first
        @add_child presentation

        presentation_video = new SiteTextItem
            name: 'video is-sim'
            txt: '<iframe width="853" height="480" src="//www.youtube.com/embed/K1MVV_nG8BI?rel=0" frameborder="0" allowfullscreen></iframe>'
        presentation.add_child presentation_video
        
#         presentation_text = new SiteTextItem
#             name: 'video is-sim'
#             txt: 'Try is-sim beta now ->'
#             fontSize : "35px"
#             fontFamily : "'Indie Flower', sans-serif"
#             fontWeight : "bold"
#             color : @textColor.highlight
#             balise : '#softhub'
#             cursor: "pointer"
#             
#         presentation.add_child presentation_text
        
        #ajout des key_idea---------------
        key_idea = new SitePartItem 
                name : 'key idea'
                type : 'column'
                balise : 'key_idea'
                title : false
                separator  : false
                background : @backgroundColor.first
                color : @textColor.first
                column_marge : 10
        @add_child key_idea
        
        col_1 = new SitePartItem 
        key_idea.add_child col_1
        col_2 = new SitePartItem 
        key_idea.add_child col_2
        col_3 = new SitePartItem 
        key_idea.add_child col_3
        
        ki_1 = new SiteTextItem
            title: 'CONNECT'
            txt: 'Access & use all your data and applications everywhere through your web browser. This is simple !'
            fontFamily : "'Indie Flower', sans-serif"
            fontSize : 22
            color : @textColor.first
        col_1.add_child ki_1
        
        ki_2 = new SiteTextItem
            title: 'COLLABORATE'
            txt: 'Share and modify all your data (text, project, 3D...) in real time !'
            fontFamily : "'Indie Flower', sans-serif"
            fontSize : 22
            color : @textColor.first
        col_2.add_child ki_2
        
        ki_3 = new SiteTextItem
            title: 'COMPUTE'
            txt: 'Use remote powerful resources ond demand. Fit them to your needs !'
            fontFamily : "'Indie Flower', sans-serif"
            fontSize : 22
            color : @textColor.first
        col_3.add_child ki_3
        
        
        logo = new SitePartItem 
            name : 'bigLogo'
            title : false
            background : @backgroundColor.first
            color : @textColor.first
        @add_child logo
        
        biglogo = new SiteImageItem
            src : "img/biglogo.png"
        logo.add_child biglogo
        
        
    add_company_item: () ->
        #team-----
        team = new SitePartItem 
                name : 'Team'
                type : 'column'
                balise : 'company'
                separator  : false
        @add_child team
        
        team_col_1 = new SitePartItem 
        team.add_child team_col_1    
              
        team_col_2 = new SitePartItem
        team.add_child team_col_2    
              
        team_col_3 = new SitePartItem
        team.add_child team_col_3
              
        
        team_1 = new IllustratedTextItem
            name: 'J.bellec'
            src: 'img/team.png'
            width: '100px'
            txt: "Jeremie Bellec : <br> CEO, PhD in mechanical engineering"
        team_col_1.add_child team_1
        
        team_2 = new IllustratedTextItem
            name: 'Hugo Leclerc'
            src: 'img/team.png'
            width: '100px'
            txt: "Hugo Leclerc : <br> Scientific advisor, PhD, CNRS"
        team_col_2.add_child team_2
        
        team_3 = new IllustratedTextItem
            name: 'Raphael Bellec'
            src: 'img/team.png'
            width: '100px'
            txt: "Raphael Bellec : <br> Associate, web entrepreneur"
        team_col_3.add_child team_3
            
        
        #goals-----
        goals = new SitePartItem 
                name : 'Goals'
                balise : 'goals'
                separator  : false
        @add_child goals
        
        goals_text = new SiteTextItem
            name: 'goals'
            textAlign : "left"
            txt: "<b>is-sim</b> was founded on the basis of several observations: <ul type='circle'>
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
        goals.add_child goals_text
        
        #awards---------------
        awards = new SitePartItem 
                name : 'Awards'
                type : 'column'
                balise : 'awards'
                separator  : false
        @add_child awards
        
        awards_col_1 = new SitePartItem 
        awards.add_child awards_col_1    
              
        awards_col_2 = new SitePartItem
        awards.add_child awards_col_2    

        
        awards_col_1.add_child new SiteTextItem
            txt: "Innovative technologies <br> (French ministery of research, BPI France)"
            
        awards_col_1.add_child new SiteImageItem
            src : "img/CCETI_oseo.png"
            width     : "200"
            
        
        awards_col_2.add_child new SiteTextItem
            txt: "Innovative SME <br> (system@tic cluster)"
            
        awards_col_2.add_child new SiteImageItem
            src : "img/logo_PME_innvante_systematic.png"
            width     : "200"
#         awards_1 = new IllustratedTextItem
#             src: 'img/CCETI_oseo.png'
#             width: '150'
#             txt: "Innovative technologies <br> (French ministery of research, BPI France)"
#         awards_col_1.add_child awards_1
        
#         awards_2 = new IllustratedTextItem
#             src: 'img/logo_PME_innvante_systematic.png'
#             width: '100'
#             txt: "Innovative SME <br> (system@tic cluster)"
#         awards_col_2.add_child awards_2
        
        
        #partners---------------
        partners = new SitePartItem 
                name : 'Partners'
                type : 'column'
                balise : 'partners'
        @add_child partners
        
        partners_col_1 = new SitePartItem 
        partners.add_child partners_col_1    
              
        partners_col_2 = new SitePartItem
        partners.add_child partners_col_2
        
        partners_col_3 = new SitePartItem
        partners.add_child partners_col_3   

        
        partners_col_1.add_child new SiteImageItem
            src : "img/logo_ministere.jpg"
            width     : "200"
            
        partners_col_2.add_child new SiteImageItem
            src : "img/logo_BPI_France.png"
            width     : "200"
            
        partners_col_2.add_child new SiteImageItem
            src : "img/logo_ESSONE.png"
            width     : "200"
            
        partners_col_3.add_child new SiteImageItem
            src : "img/logo_ens.png"
            width     : "200"
            
        partners_col_3.add_child new SiteImageItem
            src : "img/logo_incuballiance.png"
            width     : "200"
        
        

    add_solution_item: () ->
        solution = new SitePartItem 
                name : 'Solution'
                type : 'column'
                balise : 'solution'
                background : @backgroundColor.first
                color : @textColor.first
                separator  : false
        @add_child solution
        
        solution_col_1 = new SitePartItem 
        solution.add_child solution_col_1    
              
        solution_col_2 = new SitePartItem
        solution.add_child solution_col_2 
        
        solution_col_3 = new SitePartItem
        solution.add_child solution_col_3 

        
        S_1_title = new SiteTextItem
            txt: "CONNECT"
            fontSize : "25px"
            fontWeight : "bold"
        solution_col_1.add_child S_1_title  
        
        S_1_image = new SiteImageItem
            src : "img/solution_select.jpg"
            margin : "20 0 20 0"
        solution_col_1.add_child S_1_image 
        
        S_1_txt = new SiteTextItem
            title: "ONLINE DESIGN  <br> APPLICATIONS LIBRARY !"
            txt: "Third party design applications <br>  All options available  <br>  Full web unified environment"
            fontSize : 16
            fontFamily : "'Indie Flower', sans-serif"
        solution_col_1.add_child S_1_txt  
            
            
        S_2_title = new SiteTextItem
            txt: "COLLABORATE"
            fontSize : "25px"
            fontWeight : "bold"
        solution_col_2.add_child S_2_title  
        
        S_2_image = new SiteImageItem
            src : "img/solution_share.jpg"
            margin : "20 0 20 0"
        solution_col_2.add_child S_2_image 
        
        S_2_txt = new SiteTextItem
            title: "COLLABORATE <br> IN REAL TIME !"
            txt: "Collaborate on all your data in real time <br> Share immediately all your results <br> Full compatibility between applications"
            fontSize : 16
            fontFamily : "'Indie Flower', sans-serif"
        solution_col_2.add_child S_2_txt  
        
        
        S_3_title = new SiteTextItem
            txt: "COMPUTE"
            fontSize : "25px"
            fontWeight : "bold"
        solution_col_3.add_child S_3_title  
        
        S_3_image = new SiteImageItem
            src : "img/solution_simulate.jpg"
            margin : "20 0 20 0"
        solution_col_3.add_child S_3_image 
        
        S_3_txt = new SiteTextItem
            title: "POWERFUL <br> AND SIMPLE !"
            txt: "Use tremendous HPC resources <br> On demand Simulation <br> Fluid data visualisation with WebGL"
            fontSize : 16
            fontFamily : "'Indie Flower', sans-serif"
        solution_col_3.add_child S_3_txt  
        
        #description------------------
        description = new SitePartItem 
                name : 'description'
                balise : 'description'
                background : @backgroundColor.first
                color : @textColor.first
                separator : false
                title : false
        @add_child description
        
        description_txt = new SiteTextItem
            txt: "<b> is-sim </b> is a real time collaborative solution for design applications. 
                This web-based operating system offers powerfull tools to any user needing to realise design simulations and to 
                any editors needing SaaS version of their software. <b> is-sim </b> provide, in a unified environment, the best 
                third party tools, standard software as well as High Performance Computing software. All these tools are served 
                by a unified and dynamic web interface and a unified data format. Associated with the power of cloud computing and 
                centralization of computing means, software licenses and data, <b>is-sim</b> is to become the first and most 
                powerful collaborative SaaS solution."  
            textAlign  : "justify" 
        description.add_child description_txt  
        
        biglogo = new SiteImageItem
            src : "img/biglogo.png"
            margin : "20 0 20 0"
        description.add_child biglogo 
        
        
    
    
    add_services_item: () ->
        #work packages-----
        services = new SitePartItem 
                name : 'Services'
                balise : 'services'
        @add_child services
        
        
        S_1 = new SiteServiceItem
            background : @backgroundColor.highlight
            height : 200
            slogan : 'SaaS <br> enabler & provider'
            title : "FOR SOFTWARE EDITORS"
            description : "<b> How to commercialize my software worldwide with a small sales force ? </b> <br>
                SaaS distribution is the key way to increase your sales potential without massive investments. 
                <b> is-sim </b> team assists you in this transition, first by providing an online demo of your software accessible from your website  
                then gradually integrating all the functions into a full online version and building your new business model. <br>
                Whether your software is simple or highly technical, <b> is-sim </b> hybrid SaaS solution fits to your needs and gives new collaborative abilities to your software."
                
        S_2 = new SiteServiceItem
            background : @backgroundColor.highlight
            height : 200
            slogan : 'Recurring <br> business <br> model'
            title : "FOR OPEN SOURCE SOFTWARE EDITORS"
            description : "<b> How to secure my business with recurring income ? </b> <br>
                The direct answer is: by selling a quality service that simplifies the lives of your clients and that is recurrent...<br>
                <b> is-sim </b> team invites you to make your software available in SaaS mode and thus offer a large number of your users 
                the ability to simply use your applications without installation or maintenance constraints, equipment purchase...
                You give new collaborative abilities to your software and secure your business with recurring income."
                
        S_3 = new SiteServiceItem
            background : @backgroundColor.highlight
            height : 200
            slogan : 'Online Applicative journal'
            title : "FOR RESEARCH LABORATORIES"
            description : "<b> How to improve visibility of my research and sustain my algorithm development ? </b> <br>
                You can now use your algorithms as a communication medium of your research. With <b> is-sim </b> you associate 
                with each of your articles an online demonstrator of the algorithm which implements the method described. 
                You make your research reproducible, sustainable and give it a more practical aspect. Your works are understandable 
                by a greater number of people who can bring you new research contracts."
                
        S_4 = new SiteServiceItem
            background : @backgroundColor.highlight
            height : 200
            slogan : 'Maturation <br> of research algorithms'
            title : "FOR OFFICES OF TECHNOLOGY TRANSFERT"
            description : "<b> How to accelerate the maturation of my research software ? </b> <br>
                We designed around <b> is-sim </b> a new organization covering the essential stages of maturation : <ul type='circle'>
                <li>  <b> Legal maturation : </b> we propose a standard model for sharing of IP on the global solution.  </li>
                <li>  <b> Technical maturation : </b> the association with <b> is-sim </b> makes your software compatible with all other inegrated softwares and gives it a standardized ergonomic GUI already known by users. </li>
                <li>  <b> Commercial maturation : </b>  your software is now available anywhere in the world. Early adopters can directly play with it and participate to its evolution. </li>
                </ul>"
  
        
        services.add_child S_1
        services.add_child S_2
        services.add_child S_3
        services.add_child S_4
        
        
    
    add_news_item: () ->
        #news-----
        news = new SitePartItem 
                name : 'News'
                balise : 'news'
        @add_child news
        
        #ajout des news--------------- 
        
        news_1 = new SiteNewsItem
            date : '28-07-2014'
            title : "mise en ligne de la plate-forme web DICCIT"
            description : "La première version de la plate-forme web DICCIT est en ligne. 
            elle comprend ce site, un journal de démonstration en ligne public ainsi qu'un espace privé pour les membres du consortium."
        news.add_child news_1
        
        
    add_softlist_item: () ->
        #Applications de mecanique---------------
        softlist_mecanical = new SitePartItem
                name : ''
                balise : "softhub"
                stamps_title: "<b> Mechanical software </b>"  
                type : 'stamps'
                background : @backgroundColor.first
                color : @textColor.first
                highlight : @textColor.highlight
                ratio : 60
                separator  : false
                title: false
                
        @add_child softlist_mecanical
        
         
        softlist_mecanical.add_child new CorreliDemoItem
        softlist_mecanical.add_child new GmshDemoItem
        softlist_mecanical.add_child new StepReaderDemoItem
        softlist_mecanical.add_child new Plot3DDemoItem
        
        #Applications de traitement d'images---------------    
        softlist_image = new SitePartItem
                name : ''
                balise : "softhub_image"
                stamps_title: "<b> Image processing software </b>"   
                type : 'stamps'
                background : @backgroundColor.first
                color : @textColor.first
                highlight : @textColor.highlight
                ratio : 60
                separator  : true
                title: false
        @add_child softlist_image
        
        softlist_image.add_child new IpolLSDDemoItem
        softlist_image.add_child new IpolACEDemoItem
        softlist_image.add_child new IpolTVDDemoItem
        softlist_image.add_child new IpolSCADemoItem
        
        

    
    
    add_contact_item: ()->
        contact = new SitePartItem
                name : 'Contact'
                balise : "contact"
                separator  : false       
        @add_child contact
        
        contact.add_child new SiteTextItem
            txt: "86 rue de Paris, 91400 Orsay, FRANCE"  
            
        contact.add_child new SiteTextItem
            a: "mailto:contact@structure-computation.com"
            txt: "<a href='mailto:contact@structure-computation.com'> send a mail </a>"  
            
        contact.add_child new SiteTextItem
            txt: '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2633.484965886882!2d2.1946309000000097!3d48.696210899999976!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e5d61facc30587%3A0xccaaa136fb1452e7!2s86+Rue+de+Paris!5e0!3m2!1sfr!2sfr!4v1404916614372" width="900" height="450" frameborder="0" style="border:0"></iframe>'  
        
        
    
    run_test_2: () ->
        #parts------------------
        @add_presentation_item()
        @add_services_item()
        @add_solution_item()
        @add_softlist_item()
        @add_company_item()
        @add_contact_item()
        
        #menu--------------------
        @add_menu_item()
        
        
        
        
      
    
        
        
         
        
        
        
        
            
        
        
        
        
        
        
        
        
        
            
    
            
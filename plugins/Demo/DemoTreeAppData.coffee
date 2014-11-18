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
class DemoTreeAppData extends TreeAppData
    constructor: ->
        super()
     
    
    display_framework: ->
        d = new DisplaySettingsItem
            sep_norm: 0
            children: [ 
                {
                    panel_id: "ContextBar"
                    immortal: true
                    min_size: [60,0]
                    max_size: [65,1e5]
                }, {
                sep_norm: 0
                
                children: [ 
                    {
                        sep_norm: 1
                        children: [ {
                            panel_id: "TreeView"
                            immortal: true
                        }, {
                            strength: 1,
                            panel_id: "EditView"
                            immortal: true
                        } ]
                    }, {
                        panel_id: "MainView"
                        strength: 3,
                    } ]
                }
            ]
        return d 
    
            
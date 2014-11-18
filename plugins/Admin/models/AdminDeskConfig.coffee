# Copyright 2012 Structure Computation  www.structure-computation.com
# Copyright 2014 Jeremie Bellec
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
class AdminDeskConfig extends Model
    constructor: ->
        super()
        @add_attr
            name  :  "configuration desk"
            list_desk_items         : new Lst # root items 
            selected_list_desk_items: new Lst # path list
            account                 : new UserModel
            list_contact            : new Lst
            selected_organisation   : new Lst
            
        @list_desk_items.push new DeskItem "Files"
        
        @selected_list_desk_items.push @list_desk_items[0]
        
        
            
            
            
            
            
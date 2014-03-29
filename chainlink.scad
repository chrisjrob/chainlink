// chainlink.scad
// Chain link for plastic chains
//
// Copyright (C) 2013 Christopher Roberts
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

// Global Parameters
length      = 47;
width       = 27;
height      = 8;
clip_male   = 2.1;
clip_female = 2.7;
precision   = 75;

// Selection
selection   = 3; // 0 = both, 1 = male, 2 = female, 3 = demo

module chainlink_male() {

    difference() {

        // Things that exist
        union() {
            translate([0, 0, height/2]) rotate([0, 180, 180]) half_link();

            translate([ 0                  , -width  + height  , height/2 -0.1]) cylinder( r = clip_male/2, h = height*0.35 +0.2, $fn = precision/3 );
            translate([ 0                  ,  width  - height  , height/2 -0.1]) cylinder( r = clip_male/2, h = height*0.35 +0.2, $fn = precision/3 );
            translate([ width/2 - height/2, -width/2 + height/2, height/2 -0.1]) cylinder( r = clip_male/2, h = height*0.35 +0.2, $fn = precision/3 );
            translate([ width/2 - height/2,  width/2 - height/2, height/2 -0.1]) cylinder( r = clip_male/2, h = height*0.35 +0.2, $fn = precision/3 );
            translate([-width/2 + height/2, -width/2 + height/2, height/2 -0.1]) cylinder( r = clip_male/2, h = height*0.35 +0.2, $fn = precision/3 );
            translate([-width/2 + height/2,  width/2 - height/2, height/2 -0.1]) cylinder( r = clip_male/2, h = height*0.35 +0.2, $fn = precision/3 );

        }
    
    }

}

module chainlink_female() {

    difference() {

        // Things that exist
        union() {
            translate([0, 0, 0]) half_link();
        }

        // Things that don't exist
        union() {
            translate([0                     , -width   + height  , -0.1       ]) cylinder( r = clip_female/2, h = height*0.4 +0.2, $fn = precision/3 );
            translate([0                     ,  width   - height  , -0.1       ]) cylinder( r = clip_female/2, h = height*0.4 +0.2, $fn = precision/3 );
            translate([0 + width/2 - height/2, -width/2 + height/2, -0.1       ]) cylinder( r = clip_female/2, h = height*0.4 +0.2, $fn = precision/3 );
            translate([0 + width/2 - height/2,  width/2 - height/2, -0.1       ]) cylinder( r = clip_female/2, h = height*0.4 +0.2, $fn = precision/3 );
            translate([0 - width/2 + height/2, -width/2 + height/2, -0.1       ]) cylinder( r = clip_female/2, h = height*0.4 +0.2, $fn = precision/3 );
            translate([0 - width/2 + height/2,  width/2 - height/2, -0.1       ]) cylinder( r = clip_female/2, h = height*0.4 +0.2, $fn = precision/3 );
        }
    
    }

}

module half_link() {

    difference() {

        // Things that exist
        union() {
            link();
        }

        // Things that don't exist
        union() {
            translate([-width/2, -length/2, -height]) cube([width, length, height]);
        }
    
    }

}

module link() {

    // Things that exist
    union() {
        translate([0, -length/2 + width/2, 0]) half_donut();
        translate([0, length/2 - width/2, 0]) rotate([180, 0, 0]) half_donut();
        translate([-width/2 + height/2, (length-width)/2 + 0.1, 0]) rotate([90, 0, 0]) cylinder( r = height/2, h = length -width +0.2, $fn = precision);

        for (y = [-height -0.1, +height * 1.25 + 0.2] ) {
            translate([width/2 - height/2, y, 0]) rotate([90, 0, 0]) cylinder( r = height/2, h = height/4 +0.2, $fn = precision);
        }
        for (y = [-height, +height] ) {
            translate([width/2 - height/2, y, 0]) sphere( r = height/2, $fn = precision );
        }
    }

}

module half_donut() {

    difference() {

        // Things that exist
        union() {
            donut();
        }

        // Things that don't exist
        union() {
            translate([-width/2, 0, -height/2 -0.1]) {
                cube([width, width/2, height + 0.2]);
            }
        }
    
    }

}

module donut() {
    rotate_extrude(convexity = 10, $fn = precision) {
        translate([width/2 - height/2, 0, 0]) circle(r = height/2, $fn = precision);
    }
}

if (selection == 0) {
    translate( [ -width * 0.7, 0, 0] ) chainlink_male();
    translate( [ width * 0.7, 0, 0] ) chainlink_female();
} else if (selection == 1) {
    chainlink_male();
} else if (selection == 2) {
    chainlink_female();
} else if (selection == 3) {
    translate([0, 0, height * 1.2]) rotate( [0,180,0] ) chainlink_male();
    translate([0, 0, height/2]) rotate( [0,180,180] ) chainlink_female();
}

// chainlink.scad
// Chain link for plastic chains
//
// Copyright 2013 Christopher Roberts

// Global Parameters
length      = 47;
width       = 27;
height      = 8;
clip_male   = 2;
clip_female = 3;
precision   = 75;


module chainlink() {

    difference() {

        // Things that exist
        union() {
            translate([-width, 0, 0]) half_link();
            translate([width, 0, height/2]) rotate([0, 180, 180]) half_link();

            translate([ width                     , -width   + height  , height/2 -0.1]) cylinder( r = clip_male/2, h = height*0.35 +0.2, $fn = precision/3 );
            translate([ width                     ,  width   - height  , height/2 -0.1]) cylinder( r = clip_male/2, h = height*0.35 +0.2, $fn = precision/3 );
            translate([ width + width/2 - height/2, -width/2 + height/2, height/2 -0.1]) cylinder( r = clip_male/2, h = height*0.35 +0.2, $fn = precision/3 );
            translate([ width + width/2 - height/2,  width/2 - height/2, height/2 -0.1]) cylinder( r = clip_male/2, h = height*0.35 +0.2, $fn = precision/3 );
            translate([ width - width/2 + height/2, -width/2 + height/2, height/2 -0.1]) cylinder( r = clip_male/2, h = height*0.35 +0.2, $fn = precision/3 );
            translate([ width - width/2 + height/2,  width/2 - height/2, height/2 -0.1]) cylinder( r = clip_male/2, h = height*0.35 +0.2, $fn = precision/3 );

        }

        // Things that don't exist
        union() {
            translate([-width                     , -width   + height  , -0.1       ]) cylinder( r = clip_female/2, h = height*0.4 +0.2, $fn = precision/3 );
            translate([-width                     ,  width   - height  , -0.1       ]) cylinder( r = clip_female/2, h = height*0.4 +0.2, $fn = precision/3 );
            translate([-width + width/2 - height/2, -width/2 + height/2, -0.1       ]) cylinder( r = clip_female/2, h = height*0.4 +0.2, $fn = precision/3 );
            translate([-width + width/2 - height/2,  width/2 - height/2, -0.1       ]) cylinder( r = clip_female/2, h = height*0.4 +0.2, $fn = precision/3 );
            translate([-width - width/2 + height/2, -width/2 + height/2, -0.1       ]) cylinder( r = clip_female/2, h = height*0.4 +0.2, $fn = precision/3 );
            translate([-width - width/2 + height/2,  width/2 - height/2, -0.1       ]) cylinder( r = clip_female/2, h = height*0.4 +0.2, $fn = precision/3 );
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

chainlink();

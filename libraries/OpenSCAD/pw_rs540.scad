
use <./publicDomainGearV1.1.scad>

module rs540(){
od = 35.75;
length = 56.2;
mounting_hole_ring = 28;
mounting_hole = 3;
bearing = 13;
bearing_height = 4.38;
shaft = 3.18;
gear = 9.81; // 8 teeth
gear_length = 17.5;
gear_bearing_clearance = 2.55;
sleeve = 36.38;
sleeve_length = 36.9;
sleeve_from_face = 2.35;

difference(){
	union(){
		// body
		color("purple")
		cylinder(r=od/2, h=length);

		// sleeve
		translate([0,0,sleeve_from_face]){
			color("blue")
			cylinder(r=sleeve/2, h=sleeve_length);
		}

		// front bearing
		translate([0,0,-bearing_height]){
			color("green")
			cylinder(r=bearing/2, h=bearing_height);
		}

		// gear
		translate([0,0,-((gear_length/2) + gear_bearing_clearance + bearing_height)]){
			color("orange")
			//cylinder(r=gear/2, h=gear_length);
			gear(
				mm_per_tooth = 3,
				number_of_teeth = 8,
				thickness = gear_length, //6,
				hole_diameter = shaft, //3,
				twist = 0,
				teeth_to_hide = 0,
				pressure_angle = 28,
				clearance = 0.0,
				backlash = 0.0
			);
		}

		// shaft
		translate([0,0,-(gear_length + gear_bearing_clearance + bearing_height)]){
			// NOTE: need extra .1 here for watertight model
			color("black")
			cylinder(r=(shaft/2)+.1, h=(gear_length + gear_bearing_clearance + bearing_height));
		}
	}

	// mounting holes
	translate([(mounting_hole_ring/2) - (mounting_hole/2),0,-1]){
		cylinder(r=mounting_hole/2,h=10);
	}

	translate([-((mounting_hole_ring/2) - (mounting_hole/2)),0,-1]){
		cylinder(r=mounting_hole/2,h=10);
	}
}
}
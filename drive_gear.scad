use <./libraries/OpenSCAD/publicDomainGearV1.1.scad>
gear(
	mm_per_tooth = 8.69,
	number_of_teeth = 13,
	thickness = 14.94,
	hole_diameter = 13.72,
	twist = 0,
	teeth_to_hide = 0,
	pressure_angle = 28,
	clearance = 0.0,
	backlash = 0.0
);
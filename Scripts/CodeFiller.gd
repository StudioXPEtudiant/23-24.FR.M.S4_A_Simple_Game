extends Control

signal correct_code

#current 3469
@export var target_code: String

var green_color = Color(0, 1, 0, 1)
var red_color = Color(1, 0, 0, 1)


func show_filler(value: bool):
	if value: Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	visible = value

func check_code():
	var number_1 = $Panel/code_part_filler1.get_value()
	var number_2 = $Panel/code_part_filler2.get_value()
	var number_3 = $Panel/code_part_filler3.get_value()
	var number_4 = $Panel/code_part_filler4.get_value()
	
	var final_code = str(number_1) + str(number_2) + str(number_3) + str(number_4)
	
	print("final code : " + final_code)
	print("target code : " + target_code)
	
	if final_code == target_code:
		print("CODE BON !")
		
		color_animation(green_color)
		
		await get_tree().create_timer(1.2).timeout
		
		show_filler(false)
		
		correct_code.emit()
	else:
		$Panel/code_part_filler1.reset_value()
		$Panel/code_part_filler2.reset_value()
		$Panel/code_part_filler3.reset_value()
		$Panel/code_part_filler4.reset_value()
		
		color_animation(red_color)
		
		print("mauvaise code..")

func color_animation(color):
	$Panel/code_part_filler1.do_color_animation(color)
	$Panel/code_part_filler2.do_color_animation(color)
	$Panel/code_part_filler3.do_color_animation(color)
	$Panel/code_part_filler4.do_color_animation(color)

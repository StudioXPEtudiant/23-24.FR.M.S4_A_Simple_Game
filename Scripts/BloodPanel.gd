 #### ANNIM PAR CHATGPT A COMPRENDRE ! : ##

extends Panel

const DAMAGE_DURATION = 0.5 # Durée de l'animation de dégâts en secondes
const DAMAGE_FADE_TIME = 0.2 # Durée de la phase de fondu en secondes

func _ready():
	# Au démarrage, cache les taches de sang
	self.visible = false

func take_damage_blood():
	# Désactive les interactions pendant l'animation
	self.set_process_input(false)
	self.set_process_unhandled_input(false)

	# Réinitialise l'état initial du panel
	self.modulate.a = 1.0
	self.visible = true

	# Démarre l'animation de baisse d'opacité
	start_damage_animation()

func start_damage_animation():
	# Enregistre l'opacité initiale
	var initial_opacity = self.modulate.a

	# Calcule l'opacité finale
	var final_opacity = 0.0 # Opacité finale (0.0 signifie complètement transparent)

	# Calcule le nombre de frames pour l'animation
	var frames = int(DAMAGE_DURATION * 60) # Supposant un taux de rafraîchissement de 60 FPS

	# Calcule l'opacité à réduire par frame
	var opacity_delta = (initial_opacity - final_opacity) / frames

	# Crée un timer pour chaque frame de l'animation
	for i in range(frames):
		# Calcule l'opacité pour cette frame
		var current_opacity = max(initial_opacity - opacity_delta * i, final_opacity) # S'assure que l'opacité ne descend pas en dessous de 0.0

		# Met à jour l'opacité du panel
		self.modulate.a = current_opacity

		# Attend la fin de la frame
		await get_tree().create_timer(1.0 / 60.0).timeout

	# Attends un court moment après la réduction d'opacité
	await get_tree().create_timer(DAMAGE_FADE_TIME).timeout

	# Redonne la possibilité d'interagir après l'animation
	self.set_process_input(true)
	self.set_process_unhandled_input(true)

	# Cache à nouveau les taches de sang
	self.visible = false

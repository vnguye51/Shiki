timestep += 1/50+1/50*abs(sin(timestep - pi/4))
show_debug_message(timestep)
image_angle = 50*(cos(timestep) + sin(timestep))

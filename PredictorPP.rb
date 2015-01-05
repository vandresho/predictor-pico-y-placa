class PredictorPP

	attr_accessor :fch_array
	attr_accessor :fch_dia
	attr_accessor :ultimo_dgt

	def puedo_circular(placa, fecha, hora)

		@ultimo_dgt = self.control_placa(placa)

		if @ultimo_dgt
			if self.control_dia(fecha)
				if self.control_hora(hora)
					if ((@fch_dia === 'Monday' && ( @ultimo_dgt == 1 || @ultimo_dgt == 2 )) ||
						(@fch_dia === 'Monday' && ( @ultimo_dgt == 1 || @ultimo_dgt == 2 )) ||
						(@fch_dia === 'Tuesday' && ( @ultimo_dgt == 3 || @ultimo_dgt == 4 )) ||
						(@fch_dia === 'Wednesday' && ( @ultimo_dgt == 5 || @ultimo_dgt == 6 )) ||
						(@fch_dia === 'Thursday' && ( @ultimo_dgt == 7 || @ultimo_dgt == 8 )) ||
						(@fch_dia === 'Friday' && ( @ultimo_dgt == 9 || @ultimo_dgt == 0 ))	)
						return 'No puede circular'
					else 
						return 'Puede circular sin problema'
					end
				else
					return 'Puede circular sin problema'
				end
			else
				return "Pico y Placo no aplica en fin de semana"
			end
		else
			return 'Placa no valida'
		end
		
	end

	def control_placa(placa = nil)
		if placa.nil?
			return nil
		else
			@nun_placa = placa[placa.size - 1]
			@nun_placa.to_i if self.is_number?(@nun_placa) rescue nil
		end
	end

	def is_number?(num)
	  true if Float(num) rescue false
	end

	def control_dia(dia)
		@fch_array = dia.split("-")
		tm_fecha = Time.new(@fch_array[0], @fch_array[1], @fch_array[2])
		@fch_dia = tm_fecha.strftime("%A")
		if (@fch_dia === 'Saturday') || (@fch_dia === 'Sunday') 			
			return false
		else
			return true
		end
	end

	def control_hora(hora)
		hora_array = hora.split(":")
		hc = Time.new(@fch_array[0], @fch_array[1], @fch_array[2], hora_array[0], hora_array[1])
		hmi = Time.new(@fch_array[0], @fch_array[1], @fch_array[2], 7)
		hmf = Time.new(@fch_array[0], @fch_array[1], @fch_array[2], 9, 30)
		hti = Time.new(@fch_array[0], @fch_array[1], @fch_array[2], 16)
		htf = Time.new(@fch_array[0], @fch_array[1], @fch_array[2], 19, 30)
		if hc.between?(hmi, hmf) || hc.between?(hti, htf)
			return true
		else
			return false	
		end

	end

end

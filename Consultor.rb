require_relative 'PredictorPP.rb'


	ppp = PredictorPP.new
	ppp.puedo_circular('abc-3456', '2015-01-08', '07:30')
	ppp.puedo_circular('abc-3456', '2015-01-08', '10:30')
	ppp.puedo_circular('abc-3456', '2015-01-08', '16:30')
	ppp.puedo_circular('abc-3456', '2015-01-08', '23:30')
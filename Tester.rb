require 'test/unit'
require_relative 'PredictorPP.rb'

class Tester < Test::Unit::TestCase
 
  def test_control_placa
    p = PredictorPP.new
    assert_equal( nil, p.control_placa())
    assert_equal( nil, p.control_placa('abc-887g'))
    assert_equal( 3, p.control_placa('abc-2223'))
  end

  def test_is_number
    p = PredictorPP.new
    assert_equal( false, p.is_number?('a'))
    assert_equal( true, p.is_number?('3'))
  end

  def control_dia
    p = PredictorPP.new
    assert_equal( true, p.control_dia('2015-01-05'))
    assert_equal( true, p.control_dia('2015-01-06'))
    assert_equal( true, p.control_dia('2015-01-07'))
    assert_equal( true, p.control_dia('2015-01-08'))
    assert_equal( true, p.control_dia('2015-01-09'))
    assert_equal( false, p.control_dia('2015-01-10'))
    assert_equal( false, p.control_dia('2015-01-11'))
  end

  def test_control_hora
    p = PredictorPP.new
    p.fch_array = '2015-01-08'.split("-")
    assert_equal( true, p.control_hora('07:30'))
    assert_equal( false, p.control_hora('10:30'))
    assert_equal( true, p.control_hora('16:30'))
    assert_equal( false, p.control_hora('23:30'))
  end

  def test_puedo_circular
    p = PredictorPP.new
    assert_equal( 'Placa no valida', p.puedo_circular(nil, '2015-01-08', '07:30'))
    assert_equal( "Pico y Placo no aplica en fin de semana", p.puedo_circular('abc-3456', '2015-01-11', '07:30'))
    assert_equal( 'Puede circular sin problema', p.puedo_circular('abc-3456', '2015-01-06', '12:30'))
    assert_equal( 'Puede circular sin problema', p.puedo_circular('abc-3456', '2015-01-08', '07:30'))
    assert_equal( 'No puede circular', p.puedo_circular('abc-3456', '2015-01-07', '07:30'))
  end

end
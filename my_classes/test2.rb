require_relative 'sequence'

seq = Sequence.new([method(:one),method(:two),method(:three)])
args = {one:[1,2],three:[3]}

seq.call_all2(args)
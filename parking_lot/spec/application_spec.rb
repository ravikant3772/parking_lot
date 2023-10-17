require_relative "../app/helpers/validators"
require_relative "../app/helpers/display_helper"
require_relative "../app/monkey_patchers/string_monkey_patch"
require_relative "../app/models/application"
require_relative "../app/models/parking_lot"

describe Application do
	before(:each) do
    @app = Application.instance
	end

	context 'when creating instance of singltone class' do
		it 'Create instance should raise exception' do
			expect { Application.new }.to raise_error(NoMethodError)
		end
	end

	context 'when selecting option number apart from menu list' do
		it 'Select option 9' do
			@app.stub(:gets) { '9' }
			@app.select_menu
			expect do
				@app.select_menu
			end.to output("\n"+"Please select option between 1 to 8".error+"\n").to_stdout
    end
	end
end
describe Qubole do
  describe "::configure" do
    it "configures Qubole" do
      Qubole.configure(api_token: 'ksbdvcwdkjn123423', version: 'latest')
    end
  end
end

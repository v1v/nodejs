describe 'nodejs::default' do

  context 'windows' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'windows', version: '2008R2').converge(described_recipe)
    end

    it 'should include windows recipe' do
      expect(chef_run).to include_recipe 'nodejs::windows'
    end

    it 'should not include apt recipe' do
      expect(chef_run).to_not include_recipe 'apt'
    end
  end

  context 'ubuntu 12.04' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe)
    end

    it 'should include source recipe' do
      expect(chef_run).to include_recipe 'nodejs::source'
    end

    it 'should include apt recipe' do
      expect(chef_run).to include_recipe 'apt'
    end
  end

end

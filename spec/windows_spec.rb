describe 'nodejs::default' do

  let(:chef_run) do
    ChefSpec::Runner.new(platform: 'windows', version: '2008R2').converge(described_recipe)
  end

  it 'should install Windows Node.js package' do
    expect(chef_run).to install_windows_package('Node.js').with(
      source: 'http://nodejs.org/dist/v0.10.26/x64/node-v0.10.26-x64.msi',
      checksum: '82025035bfd55f87ad6e65f2434824c49c29e2d9b9f0ac15b1e01a8e4dc145b6',
      version: '0.10.26'
    )
  end

end

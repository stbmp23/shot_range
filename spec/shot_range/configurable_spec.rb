require 'spec_helper'

describe ShotRange::Configurable do
  let(:config){ Class.new.extend(ShotRange::Configurable) }

  describe ".logger" do
    context "set correnct logger type" do
      %i(logger fluentd file).each do |type|
        it ":#{type}" do
          expect{ config.logger = type }.to_not raise_error
        end
      end
    end

    context "set wrong parameter" do
      it "raise ShotRangeError" do
        expect{ config.logger = :unkown }.to raise_error(ShotRange::ShotRangeError)
      end
    end
  end

  describe ".output" do
    context "set existing directory path" do
      it "returns filepath" do
        dir = File.expand_path("..", __FILE__)
        config.output = "#{dir}/"
        expect(config.output).to eq "#{dir}/#{ShotRange::Configurable::LOGFILE_NAME}"
      end
    end

    context "set not existing directory path" do
      it "raise ShotRangeError" do
        expect{ config.output = "unkown" }.to raise_error(ShotRange::ShotRangeError)
      end
    end
  end

  describe ".load_yaml" do
    context "when yaml file exist" do
      it "set new logger" do
      end

      it "set new output" do
      end
    end

    context "when yaml file not exist" do
      it "not change configuration" do
        config.send(:load_yaml)
      end
    end
  end
end

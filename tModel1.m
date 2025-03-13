classdef tModel1 < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Test methods

        function unimplementedTest(testCase)
            open_system("model1");
            testCase.verifyTrue(true,"Unimplemented test");
        end
    end

end
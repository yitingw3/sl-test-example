classdef tSltest < simulinktest.TestCase

    properties
            workingDir;
            model;
    end
    methods(TestMethodSetup)
        % Setup for each test
        function setupWorkDir(testCase)
            import matlab.unittest.fixtures.WorkingFolderFixture;
            dir = testCase.applyFixture(WorkingFolderFixture);
            testCase.workingDir = dir.Folder;
        end
    end

    methods (Test)
        % Test methods

        function unimplementedTest(testCase)
            % Check SIL vs sim answers
            testCase.model = 'model1_24b';
            testCase.loadSystem(testCase.model);
            normResults = testCase.simulate(testCase.model, 'SimulationMode', ...
                'normal', 'InFolder', testCase.workingDir);

            % SIL simulation
            silResults = testCase.simulate(testCase.model, 'SimulationMode', ...
                'software-in-the-loop', 'InFolder', testCase.workingDir);

            % Answer mismatch check
            testCase.verifySimulationOutput(silResults, normResults);
        end
    end

end
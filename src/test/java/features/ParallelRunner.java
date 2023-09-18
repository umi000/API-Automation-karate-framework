package features;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import static org.junit.Assert.*;

import java.io.File;
import net.masterthought.cucumber.Configuration;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ParallelRunner {
    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:features")
                .outputCucumberJson(true)
                .karateEnv("demo")
                .parallel(5);
        generateReport(results.getReportDir());
        Assert.assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "QLU.ai");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}

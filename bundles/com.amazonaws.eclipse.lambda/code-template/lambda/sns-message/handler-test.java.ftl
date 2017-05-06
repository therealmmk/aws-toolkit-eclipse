<#if packageName?has_content>
package ${packageName};
</#if>

import java.io.IOException;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.events.SNSEvent;

/**
 * A simple test harness for locally invoking your Lambda function handler.
 */
public class ${handlerTestClassName} {

    private SNSEvent input;

    @Before
    public void createInput() throws IOException {
        // TODO: set up your sample input object here.
        input = TestUtils.parse("/${inputJsonFileName}", SNSEvent.class);
    }

    private Context createContext() {
        TestContext ctx = new TestContext();

        // TODO: customize your context here if needed.
        ctx.setFunctionName("Your Function Name");

        return ctx;
    }

    @Test
    public void test${handlerClassName}() {
        ${handlerClassName} handler = new ${handlerClassName}();
        Context ctx = createContext();

        String output = handler.handleRequest(input, ctx);

        // TODO: validate output here if needed.
        Assert.assertEquals("Hello from SNS!", output);
    }
}

package io.github.miquelo.exsiliens.tool;

import static picocli.CommandLine.usage;

import picocli.CommandLine;
import picocli.CommandLine.Command;

@Command(
    name="exsiliens-tool",
    mixinStandardHelpOptions=true,
    version="1.0"
)
public class Application
implements Runnable
{
    public Application()
    {
    }
    
    @Override
    public void run()
    {
        usage(Application.class, System.err);
    }
    
    @Command(
        name="domain-list",
        description="Show domain list."
    )
    public void domainList()
    {
    }
    
    public static void main(String[] args)
    {
        new CommandLine(Application.class).execute(args);
    }
}

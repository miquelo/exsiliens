package io.github.miquelo.exsiliens.agent.impl.event;

import static java.util.Objects.requireNonNull;

import java.util.EventListener;

import io.github.miquelo.exsiliens.agent.event.MachineEvent;
import io.github.miquelo.exsiliens.util.glassfish.admin.GlassFishAdminConnectionFactory;

public class MachineLostEventListener
implements EventListener
{
    private final GlassFishAdminConnectionFactory adminConnectionFactory;
    
    public MachineLostEventListener(
        GlassFishAdminConnectionFactory adminConnectionFactory)
    {
        this.adminConnectionFactory = requireNonNull(adminConnectionFactory);
    }
    
    public void machineLost(MachineEvent event)
    {
    }
}

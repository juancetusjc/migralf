package gob.minedu.uee.escale.portal.padronw.portlet;

import gob.minedu.uee.escale.portal.padronw.constants.GobMineduUeeEscalePortalPadronwPortletKeys;

import java.io.IOException;
import java.io.PrintWriter;

import javax.portlet.GenericPortlet;
import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;

/**
 * @author Juan Carlos
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=GobMineduUeeEscalePortalPadronw",
		"javax.portlet.name=" + GobMineduUeeEscalePortalPadronwPortletKeys.GobMineduUeeEscalePortalPadronw,
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class GobMineduUeeEscalePortalPadronwPortlet extends GenericPortlet {

	@Override
	protected void doView(
			RenderRequest renderRequest, RenderResponse renderResponse)
		throws IOException, PortletException {

		renderResponse.setContentType("text/html");
        PortletRequestDispatcher dispatcher =
                getPortletContext().getRequestDispatcher("/PadronPortlet_view.jsp");
        dispatcher.include(renderRequest, renderResponse);
        
	}

}
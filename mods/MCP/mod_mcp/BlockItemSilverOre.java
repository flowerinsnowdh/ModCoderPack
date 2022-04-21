package MCP.mod_mcp;

import net.minecraft.src.Material;
import MCP.ApiController;
import MCP.api.BlockItemBase;

public class BlockItemSilverOre extends BlockItemBase
{
	/**********************************************************************
	 * 
	 */
	public BlockItemSilverOre(ApiController ctrl, int textureID, Material material, Class<BlockSilverOre> cls)
	{
		super(ctrl.getBlockItemID(BlockItemSilverOre.class), textureID, material, cls);
		
		setItemName("silverOre");
	}
}

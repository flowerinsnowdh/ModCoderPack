package MCP.mod_mcp;

import org.lwjgl.opengl.GL11;

import net.minecraft.src.IBlockAccess;
import net.minecraft.src.Material;
import net.minecraft.src.Tessellator;
import MCP.ApiController;
import MCP.api.CustomRenderedBlockBase;

public class BlockConstantinum extends CustomRenderedBlockBase
{
	/**********************************************************************
	 * 
	 */
	public BlockConstantinum(ApiController api, int textureID, Material material)
	{
		super(api, api.getBlockID(BlockConstantinum.class), textureID, material);

		setHardness(2F);
		setResistance(3F);
		setStepSound(soundStoneFootstep);
		setBlockName("constantinum");
	}

	/**********************************************************************
	 * 
	 */
	@Override
	protected void renderBlock(IBlockAccess blockAccess, int x, int y, int z)
	{
        Tessellator tessellator = Tessellator.instance;
        float light;
        
        setBlockBounds(0.1f, 0.1f, 0.1f, 0.9f, 0.9f, 0.9f);

        light = blockAccess.getLightBrightness(x, y - 1, z);
        tessellator.setColorOpaque_F(1.0f * light, 0.5f * light, 0.5f * light);
        this.api.blockRenderer.renderBottomFace(this, 0.0, 0.0, 0.0, this.getBlockTextureFromSide(0));

        light = blockAccess.getLightBrightness(x, y + 1, z);
        tessellator.setColorOpaque_F(1.0f * light, 1.0f * light, 0.5f * light);
        this.api.blockRenderer.renderTopFace(this, 0.0, 0.0, 0.0, this.getBlockTextureFromSide(1));

        light = blockAccess.getLightBrightness(x, y, z - 1);
        tessellator.setColorOpaque_F(0.5f * light, 1.0f * light, 0.5f * light);
        this.api.blockRenderer.renderEastFace(this, 0.0, 0.0, 0.0, this.getBlockTextureFromSide(2));

        light = blockAccess.getLightBrightness(x, y, z + 1);
        tessellator.setColorOpaque_F(0.5f * light, 1.0f * light, 1.0f * light);
        this.api.blockRenderer.renderWestFace(this, 0.0, 0.0, 0.0, this.getBlockTextureFromSide(3));

        light = blockAccess.getLightBrightness(x - 1, y, z);
        tessellator.setColorOpaque_F(0.5f * light, 0.5f * light, 1.0f * light);
        this.api.blockRenderer.renderNorthFace(this, 0.0, 0.0, 0.0, this.getBlockTextureFromSide(4));

        light = blockAccess.getLightBrightness(x + 1, y, z);
        tessellator.setColorOpaque_F(1.0f * light, 0.5f * light, 1.0f * light);
        this.api.blockRenderer.renderSouthFace(this, 0.0, 0.0, 0.0, this.getBlockTextureFromSide(5));
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public void renderEntity(int i)
	{
        Tessellator tessellator = Tessellator.instance;

        setBlockBounds(0.1f, 0.1f, 0.1f, 0.9f, 0.9f, 0.9f);
        
        GL11.glTranslatef(-0.5F, -0.5F, -0.5F);
        
        tessellator.startDrawingQuads();
        tessellator.setNormal(0.0F, -1F, 0.0F);
        tessellator.setColorOpaque_F(1.0f, 0.5f, 0.5f);
        this.api.blockRenderer.renderBottomFace(this, 0.0D, 0.0D, 0.0D, this.getBlockTextureFromSideAndMetadata(0, i));
        tessellator.draw();
        
        tessellator.startDrawingQuads();
        tessellator.setNormal(0.0F, 1.0F, 0.0F);
        tessellator.setColorOpaque_F(1.0f, 1.0f, 0.5f);
        this.api.blockRenderer.renderTopFace(this, 0.0D, 0.0D, 0.0D, this.getBlockTextureFromSideAndMetadata(1, i));
        tessellator.draw();
        
        tessellator.startDrawingQuads();
        tessellator.setNormal(0.0F, 0.0F, -1F);
        tessellator.setColorOpaque_F(0.5f, 1.0f, 0.5f);
        this.api.blockRenderer.renderEastFace(this, 0.0D, 0.0D, 0.0D, this.getBlockTextureFromSideAndMetadata(2, i));
        tessellator.draw();
        
        tessellator.startDrawingQuads();
        tessellator.setNormal(0.0F, 0.0F, 1.0F);
        tessellator.setColorOpaque_F(0.5f, 1.0f, 1.0f);
        this.api.blockRenderer.renderWestFace(this, 0.0D, 0.0D, 0.0D, this.getBlockTextureFromSideAndMetadata(3, i));
        tessellator.draw();
        
        tessellator.startDrawingQuads();
        tessellator.setNormal(-1F, 0.0F, 0.0F);
        tessellator.setColorOpaque_F(0.5f, 0.5f, 1.0f);
        this.api.blockRenderer.renderNorthFace(this, 0.0D, 0.0D, 0.0D, this.getBlockTextureFromSideAndMetadata(4, i));
        tessellator.draw();
        
        tessellator.startDrawingQuads();
        tessellator.setNormal(1.0F, 0.0F, 0.0F);
        tessellator.setColorOpaque_F(1.0f, 0.5f, 1.0f);
        this.api.blockRenderer.renderSouthFace(this, 0.0D, 0.0D, 0.0D, this.getBlockTextureFromSideAndMetadata(5, i));
        tessellator.draw();
        
        GL11.glTranslatef(0.5F, 0.5F, 0.5F);
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public boolean isOpaqueCube()
	{
		return false;
	}
}

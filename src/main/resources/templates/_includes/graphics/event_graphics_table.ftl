                                                <#assign graphicsCount = 1>
                                                <tr>
													<td>${graphics.id}</td>
													<td><img src="/assets/getPublicAsset?assetId=${graphics.assetId}" width="200"></img></td>
													<td>${graphics.operatorName}</td>
													<td>${graphics.operatorPosition}</td>

                                                    <#-- Indicate latest one -->
													<td>
                                                        ${graphics.uploadTime}
                                                        <#if graphicsCount == 1>
                                                            &nbsp;<span class="badge badge-primary">Latest</span>
                                                        </#if>
                                                    </td>
                                                    <#-- /Indicate latest one -->

                                                    <#-- Action buttons -->
													<td>
                                                        <a href="#" class="btn btn-outline-danger btn-sm mb-1">
                                                            <i class="fa-solid fa-trash"></i>&nbsp;Delete
                                                         </a>
                                                        <a href="/assets/getPublicAsset?assetId=${graphics.assetId}&download=true" class="btn btn-outline-secondary btn-sm mb-1">
                                                            <i class="fa-solid fa-download"></i>&nbsp;Download
                                                        </a>
                                                        <a href="/assets/getPublicAsset?assetId=${graphics.assetId}&download=false" class="btn btn-outline-primary btn-sm" target="_blank">
                                                             <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                                         </a>   
                                                    </td>
                                                    <#-- /Action buttons -->

                                                    <#assign graphicsCount = graphicsCount + 1>
												</tr>